#encoding: utf-8

Dado(/^usuário logado acessa a página clientes$/) do
  @user = DATA['users']['admin']
  login.load
  login.with(@user['email'], @user['password'])
  dash.wait_for_title 
  customer.nav.customer_link.click
  #@customer.nav.logout
end

Dado(/^que eu tenho uma lista de clientes$/) do
    @tipos = ['Gold', 'Prime', 'Exclusivo', 'Platinum']
    @users = Array.new

 @tipos.each do |t|
     name = "#{Faker::Name.first_name} #{Faker::Name.last_name}" 
     @users.push(
        OpenStruct.new(
           :nome => name,
           :telefone => Faker::PhoneNumber.cell_phone,
           :email => Faker::Internet.free_email(name),
           :tipo => t,
           :obs => Faker::Lorem.paragraph
           )
        )  
     end
end
                                                                    
Quando(/^faço o cadastro desses clientes$/) do                                 
   @users.each do |u|
   customer.save(u)
  end  
end                    
                                                                             
Então(/^esses clientes deve ser exibidos na busca$/) do    
    @users.each do |u|
      customer.search(u.email)
      expect(customer.view.size).to eql 1
      expect(customer.view.first.text).to include u.nome
      expect(customer.view.first.text).to include u.email
      expect(customer.view.first.text).to include u.telefone
  end                    
end        

## tipo

Dado(/^que eu tenho um novo cliente$/) do
    @tipos = ['Gold', 'Prime', 'Exclusivo', 'Platinum']
    
    name = "#{Faker::Name.first_name} #{Faker::Name.last_name}" 
    @user = OpenStruct.new(
           :nome => name,
           :telefone => Faker::PhoneNumber.cell_phone,
           :email => Faker::Internet.free_email(name),
           :tipo => @tipos.sample,
           :obs => Faker::Lorem.paragraph
    )  
end

Quando(/^faço o cadastro desse cliente$/) do
  customer.save(@user)
end

Então(/^esse cliente deve ser exibido na busca$/) do
      customer.search(@user.email)
      expect(customer.view.size).to eql 1
      expect(customer.view.first.text).to include @user.nome
      expect(customer.view.first.text).to include @user.email
      expect(customer.view.first.text).to include @user.telefone
end                                                                  

## Background

Dado(/^cliente cadastrado com sucesso$/) do
  steps %(
    Dado que eu tenho um novo cliente
    Quando faço o cadastro desse clientes
    Então esse cliente deve ser exibido na busca 
  )
end

## Delete 

 Quando(/^faço exclusão desse cliente$/) do
     customer.wait_for_view
     customer.view.first.find('span[class*=trash]').click
     customer.delete_yes.click
end   

Então(/^esse cliente não deve ser exibido após a busca$/) do
  expect(customer.search_alert.text).to eql "\"#{@user.email}\" não encontrado."
end

## Excluindo quando o usuário busca o cliente

Quando(/^faço a exclusão bsucando esse cliente na lista$/) do
  customer.load
  customer.wait_for_view
  customer.view.each do |tr|
    if (tr.text.include?(@user.email))
     tr.find('span[class*=trash]').click
     customer.delete_yes.click
    end   
  end  
end

Então(/^esse cliente não deve ser exibido na busca$/) do
  customer.search(@user.email)
  expect(customer.search_alert.text). to eql "\"#{@user.email}\" não encontrado."
end

