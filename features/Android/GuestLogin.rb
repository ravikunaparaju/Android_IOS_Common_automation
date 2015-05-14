require 'calabash-android'
require 'calabash-android/operations'
 
class GuestLogin
  include Calabash::Android::Operations

  	def guestNav
  		touch("Button id:'splash_activity_guest'")
  	end

 	 def assertLoginSuccess
	wait_for_element_exists("Button id:'my_menu'")
	assert_text("Menu")
	end

end