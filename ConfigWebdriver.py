from win32api import GetSystemMetrics
import datetime
from selenium import webdriver
from robot.libraries.BuiltIn import BuiltIn



def loadwebdriver():
        #return webdriver.remote.webdriver.WebDriver(command_executor='http://localhost:9515',desired_capabilities = {'chromeOptions':{ 'binary': 'mts smartservice.exe'}},browser_profile=None,proxy=None,keep_alive=False)
        return datetime.datetime.now().strftime( "Y%Ym%mdH%HM%MS%S" )