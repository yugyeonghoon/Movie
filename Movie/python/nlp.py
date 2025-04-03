import pandas as pd
import re
import numpy as np

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

df["post"][:5] = df["post"][:5].apply(plot_process)

#print("="*20)
#print(df["post"])

from sklearn.feature_extraction.text import TfidfVectorizer

tfidf = TfidfVectorizer()
x_tfidf = tfidf.fit_transform(df["post"][:5])
#print(tfidf.get_feature_names_out())
#print(x_tfidf.shape)

from sklearn.metrics.pairwise import cosine_similarity

#유사도 : [1.         0.0110193  0.01953129 0.01825954 0.01306964]
#영화이름(번호) : [여호,    유레카, 소녀의기도]

# [
# {
#     "영화이름" : "소녀의기도",
#     "유사도" : 0.01953129
# },
# {
#     "영화이름" : "유레카",
#     "유사도" : 0.0110193
# }]

# 영화     유사영화      유사도
# 여호      소녀의기도    0.019
# 여호      유레카       0.011
# 유레카    여호         0.011
# 유레카    소녀의기도    0.019
# 소녀의기도 

scores = cosine_similarity(x_tfidf, x_tfidf)

# #영화 검색 / 유사도 순으로 상위 10개 영화 나열
# title_to_index = dict(zip(df["title"], df.index))
# def rank(title, scores=scores) :
#     idx = title_to_index[title]
#     sim_scores = list(enumerate(scores[idx]))

#     sim_scores = sorted(sim_scores, key=lambda x:x[1], reverse=True)

#     sim_scores = sim_scores[1:11]

#     movie_indices = [idx[0] for idx in sim_scores]
#     return df["title"].iloc[movie_indices]
# print(rank('슈퍼 햄찌'))

movie_code = df["DOCID"].to_numpy()
#print(scores)
df_list = []
for i, score in enumerate(scores):
    dict_list = dict(zip(movie_code, score))
    sorted_my_dict = sorted(dict_list.items(), key=lambda x : x[1], reverse=True)
    for movie_data in sorted_my_dict[1:6]:
        target_movie, sim = movie_data
        movie = {
            "기준영화" : movie_code[i],
            "추천영화" : target_movie,
            "유사도 " : sim
        }
        df_list.append(movie)
    
    #print(df_list)
    df = pd.DataFrame(df_list)
    #print(df)
    #scores[0]
    #[1. :여호        0.0110193 :유레카  0.01953129 :소녀의기도 0.01825954 :쓰키지 0.01306964]
    #score[0] = 여호,
    #score[1] = 유레카,
    #score[2] = 소녀의 기도
    # desc_movie_list = np.sort(score)[::-1]
    # top_5_movies = desc_movie_list[1:6]
    # print(top_5_movies)
    # df_list.append(top_5_movies)
    print(f"{movie_code[i]}영화")
    print(score)


df_list = pd.DataFrame(df_list)
df_list.to_csv("movie_sim.csv", index=False)
#df.to_csv("movie.csv", index=False)