class Chitter < Sinatra::Base

	get '/sessions/new' do
	  haml :"sessions/new"
	end

	post '/sessions' do
	  email, password = params[:email], params[:password]
	  user = User.authenticate(email, password)
	  if user
	    session[:user_id] = user.id
	    redirect to('/')
	  else
	    flash[:errors] = ["The email or password are incorrect"]
	    haml :"sessions/new"
	  end
	end
	end