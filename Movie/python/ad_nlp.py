import pandas as pd
import re
import numpy as np
import pymysql

df = pd.read_csv("ad1.csv")
print(df["cat4"].isna().sum())
print(df["cat3"].isna().sum())
df["cat1"].fillna(" ", inplace=True)
df["cat2"].fillna(" ", inplace=True)
df["cat3"].fillna(" ", inplace=True)
df["cat4"].fillna(" ", inplace=True)
df["ad_sim"] = df["title"].astype(str) + " " + df["cat1"].astype(str)+ " " + df["cat2"].astype(str) + " " + df["cat3"].astype(str) + " " + df["cat4"].astype(str)

print(df["title"].head())

df.to_csv("ad01.csv", index=False)

# from konlpy.tag import Okt

# okt = Okt()

# stopwords = ['의', '가', '이', '은', '는', '들', '과', '와', '을', '를', '이다', '하다', '를', '에서', '다', '의']

# def ad_process(plots) :

#     plots = re.sub(r"[^ㄱ-ㅎ가-힣0-9a-zA-Z\s]", "", plots)

#     plots = okt.morphs(plots, stem=True)

#     tokens = [t for t in plots if t not in stopwords]

#     tokens = " ".join(tokens)
#     return tokens

# df["ad_sim"] = df["ad_sim"].apply(ad_process)
# print("텍스트 전처리 완료")

# from sklearn.feature_extraction.text import TfidfTransformer

# print("단어사전 생성")
# tfidf = TfidfTransformer()
# x_tfidf = tfidf.fit_transform(df["ad_sim"])
# print("벡터화 완료")

# from sklearn.metrics.pairwise import cosine_similarity

# scores = cosine_similarity(x_tfidf,x_tfidf)
# print("코사인 유사도 계산 완료")

