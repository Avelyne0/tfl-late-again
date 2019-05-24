require 'bundler/setup'

Bundler.require


require 'sqlite3'
require 'pry'
require_all 'app'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/development.sqlite"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

