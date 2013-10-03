env = ENV["RACK_ENV"] || "development"
@db_url = ENV["DATABASE_URL"] if ["production", "staging"].include? env

# env == "staging" || env == "production" || env == "somethingelse"

DataMapper.setup(:default, @db_url || "postgres://localhost/bookmark_manager_#{env}")
require_relative 'models/user'
DataMapper.finalize
DataMapper.auto_upgrade!