Common Automation Framework for IOS & Android with Calabash
===========================================================
 
Calabash Installation and setup
-------------------------------

To install calabash you need Ruby and RubyGems installed on your machine. For installation instructions on Android and IOS please visit calabash github pages.

For Android:
https://github.com/calabash/calabash-android 

For IOS:
https://github.com/calabash/calabash-ios 


Automation Framework
--------------------

###Page Object Model

In page object model, we create a class file for each screen in the application and add reusable functions for elements in the screen. For example in Login.rb file we have added functions “loginnav”, “username”, “password”, “submit”, “userLogin”, “assertSuccess”, “assertLoginFail”, “checkLogin”. In login step definition we create login object and call the functions based on the steps as show in below example.
	
creating login object
login=Login.new

loginNav function to navigate to login screen  
Given(/^user navigates to login screen$/) do  
  login.loginNav  
end  

perform user actions to login   
When(/^user enters valid User name, Password and click on Login button\.$/) do  
  login.userName("#{userName}")  
  login.password("#{password}")  
  login.submit  
end  

Verifying login success  
Then(/^app should display error message for invalid login details$/) do  
  login. assertSuccess  
end  

In page object model tests are easy to maintain, reusable.  If ever there are updates in login screen where username textfield ID have been changed, we just need to update the new id in username function. All login tests are run successfully.

###Cross Platform

For an application built for IOS and Android platforms, the screens and functionality will be identical. Which meant feature files and step definitions are same and can be shared between platforms. 

To make things work

1	We used only custom steps, and in each step definition we had page objects and their methods (no direct calls to Calabash iOS or Calabash Android APIs).  
2	For each supported platform, we defined a class with implementations of the page-object methods.  
3	Created a Cucumber profile (config/cucumber.yml). Defined a profile for each platform (android and ios), and ensured that the profile loads the page object classes for the platform.  

Framework structure
-------------------
 
###apps 

Apps folder contains android and ios binaries.

###config

config folder consists cucumber.yml file. This file holds profiles to run automation tests with various options. Following profiles are currently implemented in our automation tests

1.	ios: ios profile is used to run tests on IOS platform
2.	android: android profile is used to run tests on Android platform
3.	orderTests: This profile is used to run tests in desired order. By default cucumber runs feature files in alphabetical order. Using this profile tests will start with creating a route.
4.	wip: This profile is used to exclude features or scenarios from test execution.
5.	ireport: this profile generates test report under reports -> ios folder
6.	areport: this profile generates test report under reports -> android folder


###reports

Reports folder consists ‘android’ and ‘ios’ subfolders. Which are placeholders for test reports generated while using ‘ireport’ and ‘areport’ profiles during test execution

###screenshots

Screenshots folder consists android and ios sub folders that hold screenshots for android and ios applications on failed scenarios during test execution.

###features

Features folder consists Android, features files, IOS, step definitions and support folders


####Android

This folder contains calabash custom code classes for android platform, and support code like hooks.

####IOS

this folder contains screen specific custom code classes for ios platform, and support code like hooks which needs to be executed during certain scenarios

####support

Any support code like environmental variables are added in this folder

####step definitions

This folder consists step definition ruby files, calabash uses for running the tests. 

Scripts Execution
-----------------

###Android Tests Execution:


1.	Download android apk file from Jenkins server from recent successful build 
2.	Copy downloaded apk file to “<working directory>/apps” folder.
3.	Resign apk file
“Calabash-android resign apps/apps-release.apk”
4.	run tests “Calabash-android run apps/apps-release.apk –p android –p orderTests –p areport.”
5.	On completion of tests, report will be generated in “reports/android” folder.
6.	For failure scenarios screenshots will be saved in “screenshots/android” folder 

###IOS Tests Execution:


1.	Check out latest code from Master branch
2.	Run “calabash-ios setup” command from master directory
3.	Execute app_under_test.xcodeproj file with target “app_under_test-cal”
4.	On successful build copy app_under_test-cal.app file from 
~/Library/Developer/Xcode/DerivedData/app_under_test/Build/Products/Debug-iphonesimulator/ to ~/<workingdirectory>/apps/
5.	In terminal from <workingdirectory> directory run command
Cucumber –p ios –p ireport –p orderTests

For executing tests on device
DEVICE_TARGET=<device id> BUNDLE_ID=<app bundle id> DEVICE_ENDPOINT=http://<device ip>:37265

6.	On completion of tests, report will be generated in “reports/android” folder.
7.	For failure scenarios screenshots will be saved in “screenshots/android” folder 




Note: profiles ios and android are mandatory while running tests for ios and android on common base code. Tests fail if these options are ignored.


 
Issues and Troubleshooting:
---------------------------

###Android instrumentation failed error
1.	Ensure you have resigned the test apk file before execution
2.	Run “@reintsall” tagged tests first
“Calabash-android run apps/app-release.apk features/login.feature –p android”

###Android tests doesn’t execute

When you observe no action on terminal after executing command
“Calabash-android run apps/app-release.apk features/login.feature –p android”

1.	Check if adb server is responsive by running “./adb devices” from sdk/platform-tools/ folder
2.	If adb is not responsive run the following commands on your terminal
Killall adb
adb kill-server
adb start-server
3.	Restart terminal and run your tests

Known Issues and workarounds:
-----------------------------

1.	While running android tests on nexus devices, unlock screen before running tests. Tests fail when device is in sleep or lock mode. This is device specific issue works fine on Samsung devices.
2.	IOS tests which involve entering text like ‘login.feature’ will fail on simulator if hardware keyboard is enabled. When hardware keyboard is enabled simulator won’t launch soft keyboard.  While running tests on IOS simulator disable hardware keyword.



