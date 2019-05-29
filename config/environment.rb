require 'bundler/setup'
require 'rest-client'
require 'json'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'
<<<<<<< HEAD
=======


>>>>>>> fe40726ac633d0b86100a76f36bc30c65f939f67
