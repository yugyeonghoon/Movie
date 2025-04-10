import pandas as pd
import re
import numpy as np
from konlpy.tag import Okt

df = pd.read_csv("board.csv")
print(df.head())

df["board_sim"] = df["title"].astype(str) + " " + df["content"].astype(str)

ad_df = pd.read_csv("ad01.csv")

ad_df["ad_sim"] = ad_df["title"].astype(str) + " " +ad_df["cat1"].astype(str) + " " + ad_df["cat2"].astype(str) + " " + ad_df["cat3"].astype(str) + " " + ad_df["cat4"].astype(str)

okt = Okt()

stopwords = ['의', '가', '이', '은', '는', '들', '과', '와', '을', '를', '이다', '하다', '를', '에서', '다', '의']

def plot_process(plots) :
    
    plots = re.sub(r"[^ㄱ-ㅎ가-힣\s]", "", plots)
    

    plots = okt.morphs(plots, stem=True)
    

    tokens = [t for t in plots if t not in stopwords]

    tokens = " ".join(tokens)
    return tokens

df["board_sim"] = df["board_sim"].apply(plot_process)
print("게시글 텍스트 전처리 완료")

ad_df["ad_sim"] = ad_df["ad_sim"].apply(plot_process)
print("광고 텍스트 전처리 완료")


from sklearn.feature_extraction.text import TfidfVectorizer

print("단어사전 생성")
tfidf = TfidfVectorizer()

tfidf.fit(np.concatenate((df["board_sim"].to_numpy(),ad_df
["ad_sim"].to_numpy()),axis=0))

print("벡터화 완료")

x_tfidf = tfidf.transform(df["board_sim"])

ad_tfidf = tfidf.transform(ad_df["ad_sim"])
print("광고 벡터화 완료")

from sklearn.metrics.pairwise import cosine_similarity
scores = cosine_similarity(x_tfidf, ad_tfidf)
print("코사인 유사도 계산 완료")

board_title = df["title"].to_numpy()

ad_title = ad_df['title'].to_numpy()

df_list = []
print("유사도 csv")
for i, score in enumerate(scores):
    dict_list = dict(zip(ad_title, score))
    sorted_my_dict = sorted(dict_list.items(), key=lambda x : x[1], reverse=True)
    for board_data in sorted_my_dict[1:4]:
        target_ad, sim = board_data
        print(df["title"].to_numpy()[i], board_data)

        board = {
            "기준게시물" : board_title[i],
            "추천광고" : target_ad,
            "유사도 " : sim
        }
        # cursor.execute("insert into board_similarity(base_board_title, target_board_title, similarity) values(%s, %s, %s)", (board_title[i], target_board, sim))
        # conn.commit()
        df_list.append(board)
    
df = pd.DataFrame(df_list)

df.to_csv("ad_board_sim.csv", index=False)