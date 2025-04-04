from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
import time
import pandas as pd

option = Options()
option.add_experimental_option("detach", True)
driver = webdriver.Chrome(options=option)

driver.get(f"https://search.naver.com/search.naver?ssc=tab.nx.all&where=nexearch&query="광해"&sm=tab_org&qvt=0")
rvs = driver.find_element(By.XPATH, '//*[@class="main_pack"]/div[3]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/ul/li[1]/div[1]/div[1]/span[1]')
print(rvs.text)