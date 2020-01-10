from win32api import GetSystemMetrics
import datetime
from robot.libraries.BuiltIn  import BuiltIn



def get_screen_size():
    print("Width =", GetSystemMetrics(0))
    print("Height =", GetSystemMetrics(1))
    return GetSystemMetrics(0), GetSystemMetrics(1)

def get_datetime():
    return datetime.datetime.now().strftime("Time Stamp-Year:%Y Month:%m Day:%d Hour:%H Min:%M Sec:%S")


def should_be_integer(string_temp=''):
    return isinstance(int(string_temp), int)

def Click_Element_And_Ignore_Error(element_xpath=None):
    builtin = BuiltIn().get_library_instance('BuiltIn')
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    try:
        seleniumlib.click_element(element_xpath)
    except Exception as e:
        print('Exception:\t', e)
        builtin.log_to_console('\nException:\t' + str(e))


def Input_Text_And_Ignore_Error(element_xpath=None, text=''):
    builtin = BuiltIn().get_library_instance('BuiltIn')
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    try:
        seleniumlib.input_text(element_xpath, text)
    except Exception as e:
        print('Exception:\t', e)
        builtin.log_to_console('\nException:\t' + str(e))



print ("hi there from website functions")
now =   get_datetime()
print(now)