import pandas as pd

df = pd.read_csv("as.csv")

df["title"] = df["title"].str.strip()

print(df.columns)

print(df["plota"])

df.dropna(subset=["plota"], inplace=True)

print(df.info())

df["poster"].fillna("a.jpg", inplace=True)
print(df.info())

df.dropna(subset=["genre"]["에로"], inplace=True)


df.to_csv("ac_mo.csv")
