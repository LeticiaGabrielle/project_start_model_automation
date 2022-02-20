class LoginPage < SitePrism::Page
    
    set_url '/'
    element :username, '#username'
    element :password, '#password'
    element :enter, '#kc-login'
  
    def keycloak
      username.set($auth['keycloak']['username'])
      password.set($auth['keycloak']['password'])
      enter.click
    end
  end
  