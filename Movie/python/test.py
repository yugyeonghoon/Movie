import pandas as pd

df = pd.read_csv("as.csv")

df["title"] = df["title"].str.strip()

print(df["title"])

for title in df["title"][:5]:
    print(title)