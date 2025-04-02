import requests
import pandas as pd
import json
import re

url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=H2W8Y70VM9R38UQ32FVL&startCount1&listCount=500"
result = []
list_count = 500

for i in range(0, 224) :

    start_count = i * list_count
    #0 * 500 -> 0 -> 0페이지부터 500개 0 ~ 499개
    #1 * 500 -> 500 -> 500페이지부터 500개 500 ~ 999
    #2 * 500 -> 1000 -> 1000페이지부터 500개 1000 ~ 1499

    url = f"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=H2W8Y70VM9R38UQ32FVL&startCount={start_count}&listCount={list_count}"

    print(url)
    response = requests.get(url).text
    response = response.replace("\n", "").replace("\r", "")
    response = re.sub(r"[\x00-\x1F\x7F]", "", response)
    #x00x1f ~ x00x7f

    response = json.loads(response)
    
    datas = response["Data"][0]["Result"]

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

        plots = data["plots"]["plot"][0]["plotText"]

        releaseDts = data["regDate"]

        poster = data["posters"]

        runtime = data["runtime"]

        ratingGrade = data["ratings"]["rating"][0]["ratingGrade"]

        dict = {
            "DOCID" : data["DOCID"],
            "title" : data["title"],
            "directors" : directors,
            "actors" : actors,
            "nation" : nation,
            "genre" : genre,
            "plots" : plots,
            "releaseDts" : releaseDts,
            "poster" : poster,
            "runtime" : runtime,
            "ratingGrade" : ratingGrade
        }

        result.append(dict)

df = pd.DataFrame(result)

print(df)
df.to_csv("as.csv", index=False)