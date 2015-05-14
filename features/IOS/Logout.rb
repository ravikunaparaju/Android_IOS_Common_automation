require 'calabash-android/operations'
	include Calabash::Cucumber::Operations

 
class Logout

	def logoutNav
		touch("UIButton marked:'MENU'")
	end
	def logoutButton
		wait_for_element_exists("UITableViewLabel marked:'Log out'")
		sleep(1)
		touch("UITableViewLabel marked:'Log out'")
	end
	def confLogout
		sleep(1)
		wait_for_element_exists("Button marked:'Yes'")
		touch("Button marked:'Yes'")
	end
	def logOut
		logoutNav
		logoutButton
		confLogout
		wait_for_element_exists("UIButton marked:'Use as guest'")
	end
end