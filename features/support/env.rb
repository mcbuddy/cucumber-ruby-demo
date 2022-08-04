require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'pry'
require 'rspec'
require 'selenium-webdriver'
require 'webdrivers/chromedriver' unless File.exist?('/usr/bin/chromedriver')

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless') if ENV['HEADLESS']
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--disable-gpu')
options.add_argument('--remote-debugging-port=9222')

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, timeout: 30, options: options)
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.default_max_wait_time = 30
end
