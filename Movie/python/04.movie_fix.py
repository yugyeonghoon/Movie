import pandas as pd

df = pd.read_csv("final_movie_db.csv")

df["ratingPeople"] = df["ratingPeople"].replace("등록전", "0")

#df["ratingPeople"] = df["ratingPeople"].str.extract('(\d+)')

#df["ratingPeople"] = df["ratingPeople"].replace("명 참여", "")

df["ratingPeople"] = df["ratingPeople"].replace(to_replace='(?i)\명 참여', value='', regex=True)

df["poster"] = df["poster"].replace("./aa.jpg", "aa.jpg")

df.to_csv("test_movie.csv", index=False)