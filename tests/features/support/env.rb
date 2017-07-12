require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'

require_relative 'page_objetcs'

Faker::Config.locale = 'pt-BR'

World(PageObjects)

ENV_TYPE = ENV['ENV_TYPE']
BROWSER = ENV['BROWSER']

DATA = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENV_TYPE}.yaml")

Capybara.register_driver :selenium do |app|
    
   if BROWSER.eql?('chrome') 
      # subir o chrome
      Capybara::Selenium::Driver.new(
          app,
          :browser => :chrome,
          :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
              'chromeOptions' => {
                  'args' => ['window-size=1280,800']
              }
          )
      )
   elsif BROWSER.eql?('firefox')
    # subir o firefox
    Capybara::Selenium::Driver.new(
        app,
        :browser => :firefox,
        :marionette => true
    )
   elsif BROWSER.eql?('ie')
    # subir o IE   
    Capybara::Selenium::Driver.new(
        app,
        :browser => :internet_explorer
    )
   elsif BROWSER.eql?('headless')
       #Subir o Phantomjs
       Capybara::Poltergeist::Driver.new(
           app,
           options = {
               :js_errors => false,
               :window_size => [1280,800]
           }
       )
   end     
      
 end   

Capybara.configure do |config|
     config.default_driver = :selenium
     config.app_host = DATA['url']
end

Capybara.default_max_wait_time = 5    



