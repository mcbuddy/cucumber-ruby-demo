require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'pry'
require 'rspec'
require 'webdrivers'

chrome_options = { args: [ "--no-sandbox" ]}

options = Selenium::WebDriver::Chrome::Options.new(chrome_options)
options.headless! if ENV['HEADLESS']

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, timeout: 30)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 30
end
