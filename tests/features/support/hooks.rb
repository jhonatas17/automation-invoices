

Before do
#     @login = LoginPage.new
#     @dash = DashPage.new
#     @customer = CustomerPage.new

     # volta golden backup
end

Before('@customer_page') do
  @user = OpenSruct.new(DATA['users']['admin'])
  login.load
  login.with(@user.email, @user.password)
  dash.wait_for_title 
  customer.load
end

After('@logout') do
    dash.nav.user_menu.click
    dash.nav.logout_link.click
    login.load
  end  

Before('@new_user_clean_db') do
   ### implemento um método para remover o usuário do banco
end 

  After do |scenario|
     
     @name = scenario.name.gsub(' ', '_')

     @name = @name.gsub(',', '')
     @name = @name.gsub('(', '')
     @name = @name.gsub(')', '')
     @name = @name.gsub('#', '')

     @target = "results/shots/#{@name.downcase}.png"

     #if scenario.failed?
     page.save_screenshot(@target)
     embed(@target, 'image/png', 'Clique aqui para ver a evidência')
    #end
  end