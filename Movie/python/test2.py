import pandas as pd

movies = ["a영화", "b영화", "c영화"]
scores = [
        [1, 0.02, 0.1],#a영화일 때 a,b,c영화의 유사도
        [0.02, 1, 0.5],#b영화일 때 a,b,c영화의 유사도
        [0.1, 0.5, 1],#c영화일 때 a,b,c영화의 유사도
    ]

data = []

for i, score in enumerate(scores):
    dict_list= dict(zip(movies,score))
    #print("@@@@@", dict_list.items())
    #print(f"{movies[i]}영화의 유사도 : {dict_list}")
    sorted_my_dict = sorted(dict_list.items(), key=lambda x: x[1], reverse=True)
    #print(sorted_my_dict)
    for movie_data in sorted_my_dict[1:3]:
        target_movie, sim = movie_data
        print(target_movie, sim)
        movie = {
            "기준영화" : movies[i],
            "추천영화" : target_movie,
            "유사도" : sim
        }

        data.append(movie)
    #0(a영화) -> [1 : "a", 0.02 : "b", 0.1 : "c"]
    #1 -> [0.02, 1, 0.5]
    #2 -> [0.1, 0.5, 1]

print(data)
    
df = pd.DataFrame(data)
print

#영화이름과 유사도를 딕셔너리로 결합
#유사도 기준으로 정렬했을 때 영화 이름이 섞이지 않게