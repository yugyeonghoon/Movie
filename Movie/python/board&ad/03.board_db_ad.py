import mysql.connector
import pandas as pd
import re
import numpy as np
from konlpy.tag import Okt
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from sqlalchemy import create_engine

# MySQL 연결
connection = mysql.connector.connect(
    host='localhost',  
    user='root',       
    password='ezen',   
    database='movie'   
)

cursor = connection.cursor()

cursor.execute("SELECT * FROM board")  # 데이터베이스에서 데이터 가져오기

# 결과를 pandas DataFrame으로 변환
columns = [desc[0] for desc in cursor.description]  
df = pd.DataFrame(cursor.fetchall(), columns=columns)

cursor.close()
connection.close()

# 광고 데이터도 불러오기 (ad01.csv)
ad_df = pd.read_csv("ad01.csv")

# 게시글과 광고 텍스트 결합
df["board_sim"] = df["title"].astype(str) + " " + df["content"].astype(str)
ad_df["ad_sim"] = ad_df["title"].astype(str) + " " + ad_df["cat1"].astype(str) + " " + ad_df["cat2"].astype(str) + " " + ad_df["cat3"].astype(str) + " " + ad_df["cat4"].astype(str)

# 텍스트 전처리 함수 정의
okt = Okt()
stopwords = ['의', '가', '이', '은', '는', '들', '과', '와', '을', '를', '이다', '하다', '를', '에서', '다', '의']

def plot_process(plots):
    plots = re.sub(r"[^ㄱ-ㅎ가-힣\s]", "", plots)
    plots = okt.morphs(plots, stem=True)
    tokens = [t for t in plots if t not in stopwords]
    return " ".join(tokens)

# 게시글과 광고 텍스트 전처리
df["board_sim"] = df["board_sim"].apply(plot_process)
print("게시글 텍스트 전처리 완료")

ad_df["ad_sim"] = ad_df["ad_sim"].apply(plot_process)
print("광고 텍스트 전처리 완료")

# 단어사전 생성
print("단어사전 생성")
tfidf = TfidfVectorizer()
tfidf.fit(np.concatenate((df["board_sim"].to_numpy(), ad_df["ad_sim"].to_numpy()), axis=0))

# 벡터화 완료
print("벡터화 완료")
x_tfidf = tfidf.transform(df["board_sim"])
ad_tfidf = tfidf.transform(ad_df["ad_sim"])
print("광고 벡터화 완료")

# 코사인 유사도 계산
scores = cosine_similarity(x_tfidf, ad_tfidf)
print("코사인 유사도 계산 완료")

board_title = df["title"].to_numpy()
ad_title = ad_df['title'].to_numpy()

df_list = []
print("유사도 추출 시작")

# 유사도 계산 결과를 기반으로 추천
for i, score in enumerate(scores):
    dict_list = dict(zip(ad_title, score))
    sorted_my_dict = sorted(dict_list.items(), key=lambda x: x[1], reverse=True)
    for board_data in sorted_my_dict[1:4]:
        target_ad, sim = board_data
        ad_row = ad_df[ad_df['title'] == target_ad].iloc[0]
        board_row = df.iloc[i]

        board = {
            "no": i + 1,
            "board_no": board_row["no"],
            "advertisement_title": target_ad,
            "board_title": board_title[i],
            "advertisement_link": ad_row["link"],
            "advertisement_img": ad_row["img"],
            "advertisement_board_similarity": sim
        }
        df_list.append(board)

# 결과를 DataFrame으로 저장
df_result = pd.DataFrame(df_list)

# 결과를 CSV로 저장
df_result.to_csv("board_ad_test.csv", index=False)
print("CSV 저장 완료")

# MySQL에 저장
user = "root"
password = "ezen"
host = "localhost"
port = "3306"
database = "movietest"
table_name = "ad_board_similarity"

engine = create_engine(f"mysql+pymysql://{user}:{password}@{host}:{port}/{database}")
df_result.to_sql(name=table_name, con=engine, if_exists='replace', index=False)