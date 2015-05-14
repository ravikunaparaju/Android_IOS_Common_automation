##
##Login base class with reusable functions for screen navigation, entering user name, password, submittion and assertion functions
##@Author Ravi Kunaparaju
##


require 'calabash-android'
require 'calabash-android/operations'
 
class Login
  include Calabash::Android::Operations


	def loginNav
		sleep(2)
		if element_exists("* marked:'Menu'")
			logout = Logout.new
			logout.logOut
		end
		touch("Button id:'splash_activity_login_button'")
	end

	def userName(username)
		touch("appEditText id:'login_activity_credentials_username'")
		perform_action("clear_text")
		enter_text("* id:'login_activity_credentials_username'",username)
	end

	def password(password)
		touch("appEditText id:'login_activity_credentials_passwd'")
		perform_action("clear_text")
		enter_text("* id:'login_activity_credentials_passwd'",password)
		press_back_button
	end

	def submit
		touch("Button id:'login_activity_btn_login'")
		sleep(1)
		if element_exists("TextView id:'settings_alert_dialog_ignore'")
			touch("TextView id:'settings_alert_dialog_ignore'")
		end
	end

	def assertSuccess
		wait_for_element_exists("* marked:'Menu'")
		check_element_exists("* marked:'Menu'")
	end

	def assertLoginFail
		wait_for_element_exists("* marked:'Login Failed'")
		check_element_exists("* marked:'Login Failed'")
	end

	def userLogin
		loginNav
		userName("tester@testcompany.co.uk")
		password("mobileTestTwo")
		submit
	end

	def checkLogin
  		if element_exists("Button id:'splash_activity_login_button'")
  		userLogin
  		end
  	end


end




