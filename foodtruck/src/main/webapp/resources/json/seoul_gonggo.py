from selenium import webdriver
import time
import json
import os
import shutil

def seoul_gonggo():
    ## python파일 위치
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    print(BASE_DIR)

    ##저장용 json 가져오기
    data={}
    arrays =[]
    seoul={}


    ##헤드리스 크롬 설정

    options = webdriver.ChromeOptions()
    options.add_argument('headless')
    options.add_argument('window-size=1920x1080')
    options.add_argument('disable-gpu')
    ##크롤링 해오기
    driver = webdriver.Chrome('C:/Users/BON300-25/git/Yourfoodtruck/foodtruck/src/main/java/com/food/project/seleniumTest/chromedriver.exe', chrome_options=options)
    driver.implicitly_wait(1)
    driver.get('http://www.seoul.go.kr/news/news_notice.do#list/1/srchBeginDt=20190101&srchEndDt=20190517&cntPerPage=10&srchText=%ED%91%B8%EB%93%9C%ED%8A%B8%EB%9F%AD')
    driver.implicitly_wait(3)
    a = driver.find_elements_by_css_selector('#seoul-integrated-board > table > tbody > tr > td.sib-lst-type-basic-subject > a')
    gosi_title = None
    for m in a:
        gosi_title = m
        print(m.text)
        seoul['post_title']=m.text
        print(m.get_attribute('data-code'))
        seoul['post_url']='http://www.seoul.go.kr/news/news_notice.do#view/'+m.get_attribute('data-code')
        arrays.append(seoul)
    data['region']='seoul'
    data['gonggo_list']=arrays
    with open(os.path.join(BASE_DIR, 'result.json'), 'w+',encoding="UTF-8") as json_file:
        json.dump(data, json_file,ensure_ascii=False)

    time.sleep(1)
    driver.quit()
    return repr(data)

seoul_gonggo()
