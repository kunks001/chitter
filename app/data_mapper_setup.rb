# env = ENV["RACK_ENV"] || "development"
# @db_url = ENV["DATABASE_URL"] if ["production", "staging"].include? env
env = ENV["RACK_ENV"] || "development"
# env == "staging" || env == "production" || env == "somethingelse"

# DataMapper.setup(:default, @db_url || "postgres://localhost/chitter_#{env}")
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require_relative 'models/user'
require_relative 'models/cheep'
DataMapper.finalize
DataMapper.auto_upgrade!