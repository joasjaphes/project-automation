import os;
import sys;
from selenium import webdriver
import chromedriver_autoinstaller

chromedriver_autoinstaller.install()
browser = webdriver.Chrome()
browser.get('http://github.com/login')

# print(str(sys.argv[1]))
# print(str(sys.argv[2]))
# print(str(sys.argv[3]))
# //*[@id="realbox"]
def create():
    foldername = str(sys.argv[1])
    username = str(sys.argv[2])
    password = str(sys.argv[3])
    print('excuting....')
    os.mkdir(foldername)
    username_field = browser.find_elements_by_xpath('//*[@id="login_field"]')[0]
    username_field.send_keys(username)
    password_field = browser.find_elements_by_xpath('//*[@id="password"]')[0]
    password_field.send_keys(password)
    signin_button = browser.find_elements_by_xpath('//*[@id="login"]/form/div[4]/input[12]')[0]
    signin_button.click()
    new_repo_button = browser.find_elements_by_xpath('//*[@id="repos-container"]/h2/a')[0]
    new_repo_button.click()
    repo_name = browser.find_elements_by_xpath('//*[@id="repository_name"]')[0]
    repo_name.send_keys(foldername)
    create_repo_button = browser.find_elements_by_xpath('//*[@id="new_repository"]/div[4]/button')[0]
    create_repo_button.submit()
    browser.quit()
create()