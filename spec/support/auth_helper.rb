module AuthHelper
  def http_login
    email = 'email'
    password = '1234'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(email,password)
  end  
end