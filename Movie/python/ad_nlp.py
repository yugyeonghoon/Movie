import pandas as pd
import re
import numpy as np
import pymysql

df = pd.read_csv("ad.csv")
df["ad_sim"] = df["title"].astype(str) + " " + df["cat1"] + df["cat2"] + df["cat3"] + df["cat4"]

print(df["ad_sim"].head())

df["cat1"].fillna("자료없음", inplace=True)
df["cat2"].fillna("", inplace=True)
df["cat3"].fillna("자료없음", inplace=True)
df["cat4"].fillna("자료없음", inplace=True)
df["ad_sim"].fillna("자료없음", inplace=True)

print(df["ad_sim"].head())
print(df.info())
print(df.columns)

from konlpy.tag import Okt

okt = Okt()

stopwords = ['의', '가', '이', '은', '는', '들', '과', '와', '을', '를', '이다', '하다', '를', '에서', '다', '의']

def ad_process(plots) :

    plots = re.sub(r"[^ㄱ-ㅎ가-힣0-9a-zA-Z\s]", "", plots)

    plots = okt.morphs(plots, stem=True)

    tokens = [t for t in plots if t not in stopwords]

    tokens = " ".join(tokens)
    return tokens

df["ad_sim"] = df["ad_sim"].apply(ad_process)
print("텍스트 전처리 완료")

from sklearn.feature_extraction.text import TfidfTransformer

print("단어사전 생성")
tfidf = TfidfTransformer()
x_tfidf = tfidf.fit_transform(df["ad_sim"])
print("벡터화 완료")

from sklearn.metrics.pairwise import cosine_similarity

scores = cosine_similarity(x_tfidf,x_tfidf)
print("코사인 유사도 계산 완료")

