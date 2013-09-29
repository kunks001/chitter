require 'bcrypt'

class User
	include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :password_digest, Text

end