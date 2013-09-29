require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'rack-flash'
require 'haml'
require 'sinatra/partial'

class Chitter < Sinatra::Base

  require_relative 'models/user'

  require_relative 'controllers/application'
  require_relative 'controllers/users'

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Partial

end