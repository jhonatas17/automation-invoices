#encoding: utf-8

Dado(/^acessa a página de login$/) do
   login.load
end

Dado(/^que eu tenho um usuário:$/) do |table|
   @user = OpenStruct.new(table.rows_hash)
end

Dado(/^que eu tenho um usuário do tipo "([^"]*)"$/) do |profile|
   @user = OpenStruct.new(DATA['users'][profile])   
end

Quando(/^faço o login$/) do
  login.with(@user.email, @user.password)
end

Então(/^vejo o dashboard$/) do
  expect(dash.nav.user_menu.text).to eql @user.email      
end

Então(/^vejo também a mensagem "([^"]*)"$/) do |message|
  expect(dash.title.text).to eql message
end

### Execeptions

Dado(/^que eu tenho o usuário "([^"]*)" e "([^"]*)"$/) do |email, senha|
  @user = OpenStruct.new(
      :email => email,
      :password => senha
  )
end

Então(/^vejo a mensagem "([^"]*)"$/) do |message|
    expect(login.alert.text).to include message
end

