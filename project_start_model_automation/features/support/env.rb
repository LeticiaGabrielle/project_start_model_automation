require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'capybara/dsl'
require 'pry'
require 'byebug'
require 'pg'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'
require 'rspec'
require 'date'
require 'roo'
require 'colorize'
require 'nokogiri'
require_relative 'page_helper.rb'


BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

## env - environments - urls
$env = YAML.load_file('features/config/environments.yml')[ENV['ENV']]
$auth = YAML.load_file('features/config/authentication.yml')[ENV['ENV']]

World(Pages)
World Capybara::DSL

    Dir[File.join(File.dirname(__FILE__),
    '../services/*_service.rb')].each { |file| require_relative file }
  

Capybara.register_driver :selenium do |app|

    if BROWSER.eql?('chrome')
        ##chromedriver is in C:\Windows and C:\Program Files (x86) folder for chrome updates
            browser_options = Selenium::WebDriver::Chrome::Options.new
            browser_options.add_argument('--width=1600')
            browser_options.add_argument('--height=1268')
            browser_options.add_argument('ignore-certificate-errors') #ao abrir keycloak erro de conexao particular
        Capybara::Selenium::Driver.new app, browser: :chrome, capabilities: [browser_options] 

        elsif BROWSER.eql?('firefox')
            browser_options = Selenium::WebDriver::Firefox::Options.new
            browser_options.add_argument('ignore-certificate-errors') 
        Capybara::Selenium::Driver.new app, browser: :firefox, capabilities: [browser_options] 

        elsif BROWSER.eql?('chrome_headless') 
            browser_options = Selenium::WebDriver::Chrome::Options.new
            browser_options.add_argument('--headless')
            browser_options.add_argument('--disable-dev-shm-usage')
            browser_options.add_argument('--disable-gpu')
            browser_options.add_argument('--no-sandbox')
            browser_options.add_argument('--window-size=1420,768')
            browser_options.add_argument('ignore-certificate-errors') #ao abrir keycloak erro de conexao particular
        Capybara::Selenium::Driver.new app, browser: :chrome, capabilities: [browser_options] 

        elsif BROWSER.eql?('firefox_headless') 
            browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless']) 
        Capybara::Selenium::Driver.new(app, browser: :firefox, :marionette =>true, options: browser_options)
        
    end
end



Capybara.configure do |config|
    
    config.default_driver = :selenium
    config.app_host = ($env['smart_modulos'])
    config.default_max_wait_time = 10
        
end