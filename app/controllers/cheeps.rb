class Chitter < Sinatra::Base
	post '/cheeps/new' do
    content = params["content"]
    user = current_user
    
    cheep = Cheep.new(  :content => content,
                      	:user => user
                     )
    if cheep.save
      redirect to('/')
    else
    	redirect to('/')
      flash.now[:errors] = link.errors.full_messages
      # haml :index
    end
  end
end