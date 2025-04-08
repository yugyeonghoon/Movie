import pandas as pd

df = pd.read_csv("01.all_movie.csv")

df["title"] = df["title"].str.strip()

print(df.columns)

print(df["plots"])

df.dropna(subset=["plots"], inplace=True)

print(df.info())

df["poster"].fillna("./aa.jpg", inplace=True)
print(df.info())

print(df["genre"] == "에로")

df["genre"].fillna("자료없음", inplace=True)

df.drop(df[df["genre"] == "에로"].index, inplace=True)

df.drop(df[df["genre"].str.contains("에로")].index, inplace=True)

df["actors"].fillna("자료없음", inplace=True)

df["directors"].fillna("자료없음", inplace=True)

df["nation"].fillna("자료없음", inplace=True)

df["runtime"].fillna(0, inplace=True)

df["ratingGrade"].fillna("자료없음", inplace=True)

df["repRlsDate"].fillna(20000101, inplace=True)

df["repRlsDate"] = df["repRlsDate"].astype(int)

df.drop(df[df["runtime"] < 40].index, inplace=True)

df["runtime"] = df["runtime"].astype(int)

print(df.info())

df["rating"] = "0"

df["ratingPeople"] = "0명 참여"

df["ratingPeople"] = df["ratingPeople"].str.extract('(\d+)')

df.to_csv("02.edit_movie.csv", index=False)
