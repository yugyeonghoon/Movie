import pandas as pd

df = pd.read_csv("as.csv")

df["title"] = df["title"].str.strip()

print(df.columns)

print(df["plots"])

df.dropna(subset=["plots"], inplace=True)

print(df.info())

df["poster"].fillna("a.jpg", inplace=True)
print(df.info())

df.drop(df[df["genre"] == "에로"].index, inplace=True)

df["actors"].fillna("자료없음", inplace=True)

df["directors"].fillna("자료없음", inplace=True)

df["nation"].fillna("자료없음", inplace=True)

df["runtime"].fillna(0, inplace=True)

df["ratingGrade"].fillna("자료없음", inplace=True)

df["genre"].fillna("자료없음", inplace=True)

df.drop(df[df["runtime"] < 40].index, inplace=True)

print(df.info())

df.to_csv("asc.csv", index=False)
