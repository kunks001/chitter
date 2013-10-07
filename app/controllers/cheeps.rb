class Chitter < Sinatra::Base
  get '/cheeps' do
    content_type :json
    cheeps=(Cheep.all(:order => [ :created_at.desc ]))
    @cheeps = cheeps.map do |cheep|
      datetime = cheep.created_at
      date = cheep.created_at.strftime("%m/%d/%Y")
      time = cheep.created_at.strftime("%I:%M%p")
      {
        content: cheep.content, 
        date: date, 
        time: time,
        user: cheep.user.username
      }
    end.to_json
    haml :"cheeps/index", :layout => false
  end

	post '/cheeps/new' do
    content = params["content"]
    
    cheep = Cheep.new(  :content => content,
                      	:user => current_user,
                      	:created_at => DateTime.now
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