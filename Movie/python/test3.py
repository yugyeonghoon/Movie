import pandas as pd

df = pd.read_csv("ad2.csv")

df["advertisement_cat"] = df["cat1"].astype(str) + " " + df["cat2"].astype(str) + " " + df["cat3"].astype(str) + " " + df["cat4"].astype(str)

print(df)

df.drop(columns = ['cat1'], inplace=True)
df.drop(columns = ['cat2'], inplace=True)
df.drop(columns = ['cat3'], inplace=True)
df.drop(columns = ['cat4'], inplace=True)

df.rename(columns={'img': 'advertisement_img'}, inplace=True)
df.rename(columns={'link': 'advertisement_link'}, inplace=True)


df["start_date"] = "2025-04-08"
df["end_date"] = "2025-05-08"

df.to_csv("ad3.csv", index=False)
