import requests
import pandas as pd

url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=H2W8Y70VM9R38UQ32FVL&startCount1&listCount=2"

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

    actors = " ".join([actor["actorNm"] for actor in data["actors"]["actor"]])

    dict = {
        "DOCID" : data["DOCID"],
        "title" : data["title"],
        "directors" : directors,
        "actors" : actors
    }

    result.append(dict)

df = pd.DataFrame(result)

print(df)
df.to_csv("a.csv", index=False)