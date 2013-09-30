class Chitter < Sinatra::Base
  get '/users/new' do
    haml :"users/new"
  end

  post '/users/new' do
    user = User.create( :email    => params[:email], 
                        :password => params[:password]
                      )
    session[:user_id] = user.id
    redirect to('/')
  end
end