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
    #${desiredCapability}  =  Create Dictionary    deviceName= Google Nexus 4
    ${Chromeoptions}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver     #IMHO instantiates the chromeoptions
    #Call Method  ${Chromeoptions}   add_experimental_option  mobileEmulation   ${emulation}     #works  experimental only
    Call Method   ${Chromeoptions}   add_argument  start-maximized  #headless   (works)  #windows-size=1920,1080 doesn't seem to work TMB 1/10/20
    Log To Console  now setting ChromeOptions location of binaries
    ${Chromeoptions.set_binary}=   Set Variable  set_binary   C:\\users\\brownt\\git\\Electron-api-demos\\electron-api-demos"
    ${options}=   Call Method   ${Chromeoptions}     to_capabilities
    #Log To Console    now setting desire capabilities portion of Webdriver
    #${desiredCapability}   Evaluate  sys.modules['selenium.webdriver'].DesiredCapabilities()   sys, selenium.webdriver
    #Log To Console    ${desiredCapability}

    #${options.add_argument}   Set Variable  add_argument=  --headless      #example only

    #Create WebDriver   Chrome   chrome_options=${options}  command_executor=http://localhost:9515
    # below line referenced from https://stackoverflow.com/questions/46812155/how-to-run-headless-remote-chrome-using-robot-framework
     Create WebDriver   Remote  command_executor=http://localhost:9515  desired_capabilities = ${options}    #doesn't like the desired_capailibites line
    #Create WebDriver    Chrome   desired_capabilities=${desiredCapability}
    #Go To   https://dev.mtsecho.com
    # Execute Javascript  "C:/users/brownt/git/electron-api-demos/electron-api-demos/main.js"   #just gives us a blank page TM 1/10/20

