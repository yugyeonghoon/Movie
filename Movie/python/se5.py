import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support import expected_conditions as EC
import pandas as pd
from webdriver_manager.chrome import ChromeDriverManager

# Chrome 옵션 설정
options = Options()
options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36")
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--ignore-certificate-errors')

# 브라우저 시작
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

driver.get("https://with.gsshop.com/index.gs?&media=z9&fromWith=Y")
time.sleep(3)

# 카테고리 링크 가져오기
cat_links = driver.find_elements(By.CSS_SELECTOR, ".category-group > li:nth-child(n+2):nth-child(-n+15) > .category-layer > .category-layer-content > ul > li > a")

# 데이터 저장
data = []

# 각 카테고리 링크를 순차적으로 크롤링
for link in cat_links:
    url = link.get_attribute("href")
    driver.get(url)
    print(f"Processing URL: {url}")
    
    # 페이지 로드 대기
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, "#searchPrdList")))

    # 상품목록 가져오기
    products = driver.find_elements(By.CSS_SELECTOR, "#searchPrdList > .prd-list li:nth-child(-n+8)")
    
    for prod in products:
        a_tag = prod.find_element(By.CSS_SELECTOR, "a")

        # 상품 제목
        title = a_tag.find_element(By.CSS_SELECTOR, ".prd-info > dt").text
        print(f"Product Title: {title}")
        
        # 상품 상세 링크
        link_src = a_tag.get_attribute('href')

        # 상품 이미지
        link_image = a_tag.find_element(By.CSS_SELECTOR, ".prd-img > img").get_attribute("src")

        # 상품 상세 페이지 열기
        current_window = driver.current_window_handle
        driver.execute_script(f"window.open('{link_src}', '_blank')")
        time.sleep(2)

        # 새로 열린 탭으로 전환
        new_window = [window for window in driver.window_handles if window != current_window][0]
        driver.switch_to.window(new_window)
        time.sleep(2)

        # 카테고리 가져오기
        try:
            cat1 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(2)").text
        except Exception as e:
            cat1 = ""
        try:
            cat2 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(3) > a").text
        except:
            cat2 = ""
        try:
            cat3 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(4) > a").text
        except:
            cat3 = ""
        try:
            cat4 = driver.find_element(By.CSS_SELECTOR, "#breadcrumb > span:nth-child(5) > a").text
        except:
            cat4 = ""
        print(f"Category: {cat1} > {cat2} > {cat3} > {cat4}")

        # 데이터 저장
        data.append({
            "title": title,
            "cat1": cat1,
            "cat2": cat2,
            "cat3": cat3,
            "cat4": cat4,
            "img": link_image,
            "link": link_src
        })

        # 새로 열린 탭을 닫고 원래 창으로 돌아가기
        driver.close()
        driver.switch_to.window(driver.window_handles[0])

    # 각 카테고리 링크를 클릭한 후, 데이터 처리 완료 후 **다음 카테고리**로 이동
    print(f"Finished processing category: {url}")

# 데이터 저장
df = pd.DataFrame(data)
df.to_csv("ad1.csv", index=False, encoding="utf-8-sig")

# 브라우저 종료
driver.quit()
