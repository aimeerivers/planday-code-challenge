require "rubygems"
require "webdriver_manager"
require "capybara"
require "capybara/dsl"
require "rspec"
require "selenium-webdriver"

require "pry"

Capybara.app_host = "https://test1234.planday.com"
Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_selector = :css

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

World(Capybara::DSL)
