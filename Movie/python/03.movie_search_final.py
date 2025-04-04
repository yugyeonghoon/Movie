from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
import time
import pandas as pd

option = Options()
option.add_experimental_option("detach", True)
driver = webdriver.Chrome(options=option)

df = pd.read_csv("./02.edit_movie.csv")
print(df["title"])

rvs_list = []
print(df)

start_index = 0
last_index = 10000

for i, t in enumerate(df["title"][start_index:last_index]):
  title = f"영화 {t} 관람평"

  index = i + start_index

  print(t)
  driver.get(f"https://search.naver.com/search.naver?ssc=tab.nx.all&where=nexearch&query={title}&sm=tab_org&qvt=0")

  time.sleep(2)

  try:
    rvs = driver.find_element(By.XPATH, '//*[@class="main_pack"]/div[3]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/ul/li[1]/div[1]/div[1]/span[1]')
    print(rvs.text)
    df.loc[index, "rating"] = rvs.text
    time.sleep(2)
  except Exception as e:
    print(e)
  
df.to_csv("03.movie_with_rating_1.csv", index=False)