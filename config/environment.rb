require 'bundler/setup'

Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
)

ActiveRecord::Base.logger = nil

require_all 'app'
URL_BASE = 'https://api.tfl.gov.uk'
APP_KEY = '?app_key=752dfb87ef1e3702402c660cecf36992&app_id=d4a1a955'

# Station.populate
