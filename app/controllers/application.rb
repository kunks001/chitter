class Chitter < Sinatra::Base
  get '/' do
  	@cheeps = Cheep.all(:order => [ :created_at.desc ])
    haml :index
  end
end