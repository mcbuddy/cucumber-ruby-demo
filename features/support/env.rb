require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'pry'
require 'rspec'
require 'selenium-webdriver'
require 'webdrivers/chromedriver'

webdriver_local_path = Webdrivers::Chromedriver.update
webdriver_directory = webdriver_local_path.split('/')[0..-2].join('/')
ENV['PATH'] = "#{webdriver_directory}:" + ENV['PATH']

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless') if ENV['HEADLESS']
options.add_argument('--disable-gpu')


Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, timeout: 30, options: options)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 30
end
