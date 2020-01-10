from win32api import GetSystemMetrics
import datetime
#import selenium
from selenium import webdriver
from robot.libraries.BuiltIn import BuiltIn


def get_datetime():
    return datetime.datetime.now().strftime("Y%Ym%mdH%HM%MS%S")


def loadwebdriver():
    webdriver.remote.webdriver.WebDriver( command_executor='http://localhost:9515',
       desired_capabilities = {'chromeOptions': {
        'binary': "C:\\users\\brownt\\AppData\\Local\\SmartService\\app-3.2.0\\MTSSmartService.exe"}},
         browser_profile = None, proxy = None, keep_alive = False )
    #remote_app: object = webdriver.remote.webdriver.WebDriver( command_executor='http://localhost:9515',
    #            desired_capabilities={'chromeOptions': {'binary':"C:\\users\\brownt\\AppData\\Local\\SmartService\\app-3.2.0\\MTSSmartService.exe" }},
    #            browser_profile=None, proxy=None, keep_alive=False )
