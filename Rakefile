require 'data_mapper'
require './app/data_mapper_setup'

task :auto_migrate do  
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (data was lost)"
end

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end