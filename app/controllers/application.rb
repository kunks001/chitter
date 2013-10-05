class Chitter < Sinatra::Base
  get '/' do
  	@cheeps = Cheep.all
    haml :index
  end
end