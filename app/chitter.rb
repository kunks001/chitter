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

  require_relative 'helpers/application_helper'

  require_relative 'data_mapper_setup'

  helpers ApplicationHelper

  enable :sessions
  set :session_secret, 'super secret'

  set :public_folder, 'public'
  set :static, true

  use Rack::Flash
  use Rack::MethodOverride


  register Sinatra::Partial

end