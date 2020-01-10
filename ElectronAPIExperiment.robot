*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
#Library          MongoDBLibrary
#Library          ConfigWebDriver.py         WITH NAME  my_driver
Library          src/Website_Functions.py   WITH NAME  my_code
Library          utilities.py               WITH NAME  my_utilities
Variables        vars.py

*** Variables ***
${desiredCapability}

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Log To Console    calling create driver
    ${DateTime}=       my_code.get_datetime
    Log To Console   ${DateTime}
    #MongoConnectionManager.Connect_to_mongoDB   dbhost=172.20.31.236 dbPort=27017


    #${driver}=         my_utilities.loadwebdriver
    #Create Webdriver    Remote    desired_capabilities=${binary_location}    command_executor=http://localhost:9515

#second method as described in https://github.com/robotframework/SeleniumLibrary/issues/529
    #${desiredCapability}  #=  Create Dictionary    deviceName= Google Nexus 4
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver     #IMHO instantiates the chromeoptions
    #Call Method  ${options}   add_experimental_option  mobileEmulation   ${emulation}     #works  experimental only
    Call Method   ${options}   add_argument  start-maximized  #headless   (works)  #windows-size=1920,1080 doesn't seem to work TMB 1/10/20
    Log To Console  now getting desired capabilities
    # add the desired capability as a dictionary item that contains the binary location and
    ${desiredCapability}   Evaluate  sys.modules['selenium.webdriver'].DesiredCapabilities()   sys, selenium.webdriver    #maynot need,  handled through chromeoptions
    Call Method   ${options}   add_argument binary   werwer

    Create WebDriver   Chrome   chrome_options=${options}   command_executor=http://localhost:9515
    #Go To   https://dev.mtsecho.com
    # Execute Javascript  "C:/users/brownt/git/electron-api-demos/electron-api-demos/main.js"   #just gives us a blank page TM 1/10/20

