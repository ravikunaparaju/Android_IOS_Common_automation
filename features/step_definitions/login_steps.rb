##
##Login step definitions for valid, invalid and guest scenarios
##This step definition uses class files Login.rb, GuestLogin.rb for navigation, login and asserting
##@Author Ravi Kunaparaju
##


## 
## Steps for verifying Valid user login
##

invUserName = "tester@company.co.uk"
invPassword = "mobileTwo"

login=Login.new
Given(/^user navigates to login screen$/) do
  login.loginNav
end

When(/^user enters valid User name, Password and click on Login button\.$/) do
  userLogin
end

Then(/^app should display Main Map View screen$/) do
	login.assertSuccess
end

##
## Steps for verifying invalid user login
##
When(/^user enters invalid User name, Password details and click on Login button\.$/) do
  login.userName("#{invUserName}")
  login.password("#{invPassword}")
  login.submit
end

Then(/^app should display error message for invalid login details$/) do
  login.assertLoginFail
end

##
##Steps for verifying guest login
##
guest = GuestLogin.new

Given(/^user launches the app first time$/) do
  sleep(0.5)
end

When(/^user taps on Use as guest text$/) do
  guest.guestNav
end

Then(/^user should see Main map view screen$/) do
  guest.assertLoginSuccess
end

