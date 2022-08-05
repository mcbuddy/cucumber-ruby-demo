require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'pry'
require 'rspec'
require 'selenium-webdriver'
require 'webdrivers'

options = Selenium::WebDriver::Chrome::Options.new
options.add_arguments('--headless') if ENV['HEADLESS']
options.add_arguments('--disable-dev-shm-usage')
options.add_arguments('--disable-gpu')

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, timeout: 30, options: options)
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.default_max_wait_time = 30
end
