

class LoginPage <SitePrism::Page
   set_url '/login'  

  section :nav, Sections::NavBar, '#navbar'

  element :email, '#email'
  element :password, 'input[placeholder*=senha]'
  element :sign_in, '.login-button'

  element :alert, 'div[class$=alert-warning]'

  def with(email, pwd)
      self.email.set email
      self.password.set pwd
      self.sign_in.click
  end
end
 

