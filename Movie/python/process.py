import pandas as pd

df = pd.read_csv("as.csv")

df["title"] = df["title"].str.strip()

print(df.columns)

print(df["plots"])

df.dropna(subset=["plots"], inplace=True)

print(df.info())

df["poster"].fillna("aa.jpg", inplace=True)
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



df.drop(df[df["runtime"] < 40].index, inplace=True)

print(df.info())
#df.to_csv("movie.csv", index=False)
=======

df["rating"] = "0"

df.to_csv("movie.csv", index=False)
>>>>>>> 2f483893f5e48c3d46252270c671383b78061790
