require 'calabash-android/operations'

class Network
	include Calabash::Android::Operations

	def ignoreSettings
		touch("TextView id:'settings_alert_dialog_ignore'")
	end
end
