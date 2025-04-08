import pandas as pd
import re
import numpy as np
import pymysql

conn = pymysql.connect(
    host="localhost",
    user="root",
    password="ezen",
    database="movie"
)


cursor = conn.cursor()

df = pd.read_csv("movie.csv")
df["post"] = df["title"].astype(str) + " " + df["plots"].astype(str) + " " + df["directors"].astype(str) + " " + df["actors"].astype(str) + " " + df["genre"].astype(str)

from konlpy.tag import Okt

okt = Okt()

stopwords = ['의', '가', '이', '은', '는', '들', '과', '와', '을', '를', '이다', '하다', '를', '에서', '다', '의']

def plot_process(plots) :
    
    plots = re.sub(r"[^ㄱ-ㅎ가-힣0-9a-zA-Z\s]", "", plots)
    

    plots = okt.morphs(plots, stem=True)
    

    tokens = [t for t in plots if t not in stopwords]
    #print(tokens)

    tokens = " ".join(tokens)
    return tokens

df["post"] = df["post"].apply(plot_process)
print("텍스트 전처리 완료")

from sklearn.feature_extraction.text import TfidfVectorizer

print("단어사전 생성")
tfidf = TfidfVectorizer()
x_tfidf = tfidf.fit_transform(df["post"])
print("벡터화 완료")

from sklearn.metrics.pairwise import cosine_similarity

def cos_sim(A, B, batch_size=1000):
    """
    A: (N, D) 크기의 numpy 배열
    B: (M, D) 크기의 numpy 배열
    batch_size: A를 몇 개씩 나눠서 계산할지 크기 (기본값 1000)
    
    리턴: (N, M) 크기의 코사인 유사도 행렬
    """
    n = A.shape[0]
    m = B.shape[0]
    result = np.memmap("movie_sim.dat", mode="w+", shape=(n, m), dtype=np.float32)

    for i in range(0, n, batch_size):
        end_i = min(i + batch_size, n)
        print(f"{i} ~ {end_i}행 계산 중...")
        result[i:end_i] = cosine_similarity(A[i:end_i], B)

    return result

scores = cos_sim(x_tfidf, x_tfidf)
print("코사인 유사도 계산 완료")

movie_code = df["DOCID"].to_numpy()

#df_list = []
print("유사도 csv")
for i, score in enumerate(scores):
    dict_list = dict(zip(movie_code, score))
    sorted_my_dict = sorted(dict_list.items(), key=lambda x : x[1], reverse=True)
    for movie_data in sorted_my_dict[1:6]:
        target_movie, sim = movie_data
        print(movie_data)

        movie = {
            "기준영화" : movie_code[i],
            "추천영화" : target_movie,
            "유사도 " : sim
        }
        cursor.execute("insert into movie_similarity(base_movie_docid, target_movie_docid, similarity) values(%s, %s, %s)", (movie_code[i], target_movie, sim))
        conn.commit()
        #df_list.append(movie)
    
#df = pd.DataFrame(df_list)

#df.to_csv("movie_sim.csv", index=False)