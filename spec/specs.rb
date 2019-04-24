require 'jwt'

API = 'https://api.com'
MOCKAROO_MY_API = 'https://my.api.mockaroo.com'
MOCKAROO_API = 'https://api.mockaroo.com/api'
M_KEY = 'fdea44f0'

SECRET = '123'

def generateToken subject
  exp = Time.now.to_i + 3600
  payload = {:data => 'data', :sub => subject, :exp => exp}
  token = JWT.encode payload, SECRET, 'HS256'
end
