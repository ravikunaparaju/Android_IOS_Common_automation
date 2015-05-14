require 'calabash-android/operations'
	include Calabash::Cucumber::Operations

 
class GuestLogin

  	def guestNav
  		if element_exists("* marked:'MENU'")
			logout = Logout.new
			logout.logOut
		end
		touch("* marked:'Use as guest'")
  	end

 	def assertLoginSuccess
		check_element_exists("* marked:'MENU'")
	end

end