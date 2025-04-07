#구글 봇 감지 우회
import subprocess
#서브에서 동작하는 코드

import pandas as pd

import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

chrome_browser = subprocess.Popen(r'C:\Program Files\Google\Chrome\Application\chrome.exe --remote-debugging-port=9222 --user-data-dir="C:\chromeCookie"')

options = Options()
options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36")
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--ignore-certificate-errors')
options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

#카테고리 > 패션의류/잡화 링크
#driver.get("https://www.coupang.com/np/categories/564653")
#time.sleep(2)


# products = driver.find_element(By.CLASS_NAME,"newcx-search-filter")

#카테고리 여성패션 클릭
#driver.find_element(By.XPATH, "//*[@id='searchCategoryComponent']/ul/li[1]/label/a").click()

#links = ["https://www.coupang.com/np/categories/564653", "https://www.coupang.com/np/categories/186764"]


driver.get("https://with.gsshop.com/index.gs?&media=z9&fromWith=Y")
time.sleep(3)

#el = driver.find_element(By.CLASS_NAME, "category-wrap")

cat_links = driver.find_elements(By.CSS_SELECTOR, ".category-group > li:nth-child(n+2):nth-child(-n+15) > .category-layer > .category-layer-content > ul > li > a")
#[<a href=""></a>, <a href=""></a>]
#href = cat_links.find_element(By.CSS_SELECTOR, "div ul li a").click()

#links = [cat_links]
#print(links)

#데이터 저장
data = []

for link in cat_links:
    #link = <a href="https://www.gsshop.com/shop/sect/sectL.gs?sectid=1660575&amp;lseq=414301-2&amp;cate_link=300-1660575&amp;gsid=ECmain-AU414301-AU414301-2">여성트렌드의류</a>
    url = link.get_attribute("href")
    driver.get(url)
    time.sleep(3)
    # #클릭한 링크에서 스크롤 내리기
    # height = driver.execute_script("return document.body.scrollHeight")
    # print(height)

    # height = driver.execute_script("return document.body.scrollHeight")
    # print(height)

    # while True:
    #     driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
    #     time.sleep(2)
    #     new_height = driver.execute_script("return document.body.scrollHeight")
    #     if height == new_height:
    #         break
    #     height = new_height


    #상품목록 가져오기
    products = driver.find_elements(By.CSS_SELECTOR, ".prd-list > li:nth-child(-n+8)")
    #[<li><a></a></li>, <li><a></a></li>, <li><a></a></li>, <li><a></a></li>, <li><a></a></li>]
    
    for links in products:
        #<li><a></a></li>
        a_tag = links.find_element(By.CSS_SELECTOR, "a")
        #<a></a>

        #상품 제목
        title = a_tag.find_element(By.CSS_SELECTOR, ".prd-info > .prd-name > span").text

        #상품 상세정보링크
        link_src = a_tag.get_attribute('href')
        #print(link_src)

        #상품 이미지
        link_image = a_tag.find_element(By.CSS_SELECTOR, ".prd-img > img").get_attribute("src")

        #상품 상세 정보 링크로 들어감
        driver.execute_script(f"window.open('{link_src}', '_blank')")
        time.sleep(2)

        driver.switch_to.window(driver.window_handles[1])
        time.sleep(2)

        #카테고리 가져오기
        cat1 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(2)").text

        cat2 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(3) > a").text

        cat3 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(4) > a").text

        cat4 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(5) > a").text

        data.append({
            "title" : title, 
            "cat1" : cat1, 
            "cat2" : cat2, 
            "cat3" : cat3,
            "cat4" : cat4, 
            "img" : link_image, 
            "link" : link_src
        })

        driver.close()

        driver.switch_to.window(driver.window_handles[0])

df = pd.DataFrame(data)
df.to_csv("ad1.csv")