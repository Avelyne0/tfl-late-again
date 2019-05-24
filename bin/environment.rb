require 'bundler/setup'

Bundler.require

require 'pry'

require_relative "../lib/excuse"
require_relative "../lib/user"
require_relative "sql_runner"

@db = SQLite3::Database.new('../users.db')
@db.execute("DROP TABLE IF EXISTS users;")
@sql_runner = SQLRunner.new(@db)
@sql_runner.execute_schema_migration_sql
