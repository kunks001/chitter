class Chitter < Sinatra::Base
  get '/' do
  	@cheeps = Cheep.all(:order => [ :created_at.desc ])
  	haml :index, :layout => :layout
	end
end

  	# content_type :json
  	# @cheeps = Cheep.all(:order => [ :created_at.desc ]).to_json
#   	@cheeps = Cheep.all(:order => [ :created_at.desc ])
#     haml :index
#   end
# end

# case request_type?
#     when :mobile  then haml :'mobile/chapters', :layout => :'mobile/layout'
#     when :ajax    then haml :chapters, :layout => false # json
#     else haml :chapters, :layout => :'static/layout'
#   end
# end