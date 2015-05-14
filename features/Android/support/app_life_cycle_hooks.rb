require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  start_test_server_in_background
end


After do |scenario|
  if scenario.failed?
    screenshot_embed(:prefix => "screenshots/android/",  :name => "error_#{Time.now.to_i}")
  end
  shutdown_test_server
end
