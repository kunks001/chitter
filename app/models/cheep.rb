require 'bcrypt'

class Cheep
	include DataMapper::Resource

	has 1, :user, :through => Resource

	property :id, Serial
	property :content, Text
	property :created_at, DateTime

end