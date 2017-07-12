require_relative '../pages/sections'

module PageObjects
   def login; LoginPage.new; end    
   def dash; DashPage.new; end
   def customer; CustomerPage.new; end    
end   