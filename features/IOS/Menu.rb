require 'calabash-android/operations'
	include Calabash::Cucumber::Operations

 
class Menu

	def menuNav
		login = Login.new
		login.checkLogin
		wait_for_element_exists("UIButton marked:'MENU'")
		touch("UIButton marked:'MENU'")
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