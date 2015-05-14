##
##Login base class with reusable functions for screen navigation, entering user name, password, submittion and assertion functions
##@Author Ravi Kunaparaju
##


require 'calabash-android/operations'
	include Calabash::Cucumber::Operations

 
class Login

$user = "tester@calabash.com"
$pass = "mobileAutomationTest"

	def loginNav
		sleep(0.5)
		checkIfAlreadyLoggedin
		wait_for_element_exists("Button marked:'Log in'")
		touch("OSRoundedButton marked:'Log in'")
	end

	def checkIfAlreadyLoggedin
		if element_exists("* marked:'MENU'")
			logout = Logout.new
			logout.logOut
		end
	end

	def userName(username)
		wait_for_element_exists("* marked:'Email address'")
		enter_text("* marked:'Email address'",username)
	end

	def password(password)
		enter_text("* marked:'Password'",password)
		touch "UILabel marked:'Login'"
	end

	def submit
		touch("Button marked:'Log in'")
		sleep(2)
	end

	def assertSuccess
		check_element_exists("* marked:'MENU'")
	end

	def assertLoginFail
		check_element_exists("* marked:'Login'")
	end

	def userLogin
		loginNav
		userName("#$user")
		password("#$pass")
		submit
		sleep(0.5)
		wait_for_element_exists("UIButton marked:'MENU'")
	end

	def checkLogin
  		if element_exists("Button marked:'Log in'")
  		userLogin
  		end
  	end


end




