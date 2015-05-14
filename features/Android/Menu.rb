require 'calabash-android'
require 'calabash-android/operations'
 
class Menu
  include Calabash::Android::Operations
   	
	def menuNav
		login = Login.new
		login.checkLogin
		wait_for_element_exists("Button id:'app_menu'")
		touch("Button id:'app_menu'")
	end

	def menuMyActivity
		touch("* id:'menu_my_activity'")
	end

	def menuMyFav
		touch("* id:'menu_my_favourites'")
	end

	def menuGetDirections
		touch("* id:'menu_get_directions'")
	end

	def menuMyAccount
		touch("* id:'menu_my_account'")
	end

	def menuLogout
		touch("* {text like 'Log out'}")
	end
end