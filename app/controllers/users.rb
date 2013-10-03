class Chitter < Sinatra::Base
  get '/users/new' do
    haml :"users/new"
  end

  post '/users/new' do
    user = User.new(  :email => params[:email], 
                      :password => params[:password],
                      :password_confirmation  => params[:password_confirmation]
                    )
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      haml :"/users/new"
    end
  end
end