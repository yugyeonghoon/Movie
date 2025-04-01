import requests
import pandas as pd

url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=H2W8Y70VM9R38UQ32FVL&startCount1&listCount=500"

# for i in range(223) :
#     start_count = i * 500
#     url = f"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=H2W8Y70VM9R38UQ32FVL&startCount={start_count}&listCount=500"

response = requests.get(url).json()

datas = response["Data"][0]["Result"]

result = []

for data in datas:
    #print(data["DOCID"])
    #print(data["title"])

    # directors = data["directors"]["director"]

    # 감독 = []
    
    # for director in directors:
    #     감독.append(director["directorNm"])
    
    # 감독 = " ".join(감독)
    # print(감독)

    directors = " ".join([director["directorNm"] for director in data["directors"]["director"]])

    actors = " ".join([actor["actorNm"] for actor in data["actors"]["actor"][:5]])

    nation = data["nation"]

    genre = data["genre"]

    plots = " ".join([plot["plotText"] for plot in data["plots"]["plot"]])

    releaseDts = data["regDate"]

    poster = data["posters"]

    runtime = data["runtime"]

    dict = {
        "DOCID" : data["DOCID"],
        "title" : data["title"],
        "directors" : directors,
        "actors" : actors,
        "nation" : nation,
        "genre" : genre,
        "plot" : plots,
        "releaseDts" : releaseDts,
        "poster" : poster,
        "runtime" : runtime
    }

    result.append(dict)

df = pd.DataFrame(result)

print(df)
df.to_csv("as.csv", index=False)