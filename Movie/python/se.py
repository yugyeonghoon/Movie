#구글 봇 감지 우회
import subprocess
#서브에서 동작하는 코드

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


driver.get("https://www.coupang.com/")

#카테고리의 링크 다 출력
#.category-btn > div.category-layer > ul.menu shopping-menu-list > li > a 태그의 href 다 가져오는 법
cat_links = driver.find_element(By.CSS_SELECTOR, ".category-btn > div.category-layer > ul.shopping-menu-list > li > a").get_attribute("href")

links = [cat_links]

for link in links:
    driver.get(link)
    time.sleep(3)
    #클릭한 링크에서 스크롤 내리기
    height = driver.execute_script("return document.body.scrollHeight")
    print(height)

    height = driver.execute_script("return document.body.scrollHeight")
    print(height)

    while True:
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
        time.sleep(2)
        new_height = driver.execute_script("return document.body.scrollHeight")
        if height == new_height:
            break
        height = new_height


    #상품목록 가져오기
    products = driver.find_elements(By.CSS_SELECTOR, ".baby-product-list > .baby-product")
    #[<li><a></a></li>, <li><a></a></li>, <li><a></a></li>, <li><a></a></li>, <li><a></a></li>]
    links = []

    #데이터 저장
    data = []
    #한번에 a태그까지
    #link = driver.find_elements(By.CSS_SELECTOR, ".baby-product > a.baby-product-link")
    #print(link)

    #안되서 이미지랑 링크만 따로 불러옴 근데 안됨
    for links in products:
        #<li><a></a></li>
        a_tag = links.find_element(By.CSS_SELECTOR, "a")
        #<a></a>

        #상품 제목
        title = a_tag.find_element(By.CSS_SELECTOR, "dl > dd > .name").text

        #상품 상세정보링크
        link_src = a_tag.get_attribute('href')
        #print(link_src)

        #상품 이미지
        link_image = a_tag.find_element(By.CSS_SELECTOR, "dl > dt > img").get_attribute("src")

        #상품 상세 정보 링크로 들어감
        driver.execute_script(f"window.open('{link_src}', '_blank')")
        time.sleep(2)

        driver.switch_to.window(driver.window_handles[1])
        time.sleep(2)

        #카테고리 가져오기
        #category-layer
        #category-layer 클래스 안에 있는 li 태그[1], li 태그[2], li 태그[3] 안의 a 태그의 href 꺼내와야지
        cat1 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > li:nth-child(2) > a").get_attribute("href")

        cat2 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > li:nth-child(3) > a").get_attribute("href")

        cat3 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > li:nth-child(4) > a").get_attribute("href")

        data.append({
            "title" : title, 
            "cat1" : cat1, 
            "cat2" : cat2, 
            "cat3" : cat3, 
            "img" : link_image, 
            "link" : link_src
        })

        driver.close()

        driver.switch_to.window(driver.window_handles[0])
        
        #상품 이미지
        
        #print(link_image)

        # links.append({
        #     'src' : link_src,
        #     'alt' : link_alt,
        # })
    #driver.close()

# for product, one in products:
#     element = driver.find_elements(By.CLASS_NAME, "baby-product-list > baby-product-wrap")
#     #상품 상세 링크 출력
#     # 

#     #상품 이미지 출력
#     # image = product.find_element(By.CSS_SELECTOR, ".baby-product > a.baby-product-link > dl > .image > img")["src"]

#     #상품 제목 출력
#     name = product.find_element(By.CSS_SELECTOR, ".baby-product > a.baby-product-link > dl > dd.descriptions > div.name").text

#     src = one['src']
#     alt = one['alt']

#     # print("상품 이름: ", name, "상품 링크: ", link, "상품 이미지: ", image)

#     print("상품 이름: ", name, "상품 링크: ", alt, "상품 이미지: ", src)

#     print("상품 이름: ", name)