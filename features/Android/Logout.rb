require 'calabash-android/operations'

class Logout
	include Calabash::Android::Operations

	def logoutNav
		touch("Button id:'app_menu'")
		scroll("ScrollView",:down)
		scroll("ScrollView",:down)
		scroll("ScrollView",:down)
	end
	def logoutButton
		touch("TextView id:'menu_logout'")

	end
	def confLogout
	end
	def logOut
		logoutNav
		logoutButton
		wait_for_element_exists("Button id:'splash_activity_login_button'")
	end
end