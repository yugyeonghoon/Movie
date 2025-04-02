import pandas as pd
import re

df = pd.read_csv("movie.csv")
df["post"] = df["title"].astype(str) + " " + df["plots"].astype(str) + " " + df["directors"].astype(str) + " " + df["actors"].astype(str) + " " + df["genre"].astype(str)
print("="*20)
print(df["post"])


#plots = re.sub(r"[^ㄱ-ㅎ가-힣0-9a-zA-Z\s]", "", df["post"].str)

#print(plots)

from konlpy.tag import Okt

okt = Okt()
#plots = okt.morphs(plots, stem=True)

stopwords = ['의', '가', '이', '은', '는', '들', '과', '와', '을', '를', '이다', '하다', '를', '에서', '다', '의']

# tokens = []
# for plot in plots :
#     if plot not in stopwords :
#         tokens.append(plot)
# print(tokens)

def plot_process(plots) :
    #print(plots)
    plots = re.sub(r"[^ㄱ-ㅎ가-힣0-9a-zA-Z\s]", "", plots)
    #print(plots)

    plots = okt.morphs(plots, stem=True)
    #print(plots)

    tokens = [t for t in plots if t not in stopwords]
    #print(tokens)

    tokens = " ".join(tokens)
    return tokens

df["post"] = df["post"].apply(plot_process)

print("="*20)
print(df["post"])

from sklearn.feature_extraction.text import TfidfVectorizer

tfidf = TfidfVectorizer()
x_tfidf = tfidf.fit_transform(df["post"])
print(tfidf.get_feature_names_out())
#print(x_tfidf.toarray())

from sklearn.metrics.pairwise import cosine_similarity

score = cosine_similarity(x_tfidf, x_tfidf)

df.to_csv("movie_tfidf.csv", index=False)