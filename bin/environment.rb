require 'bundler/setup'

Bundler.require

require 'pry'

require_relative "../lib/pokemon"
require_relative "../lib/scraper"
require_relative "sql_runner"

@db = SQLite3::Database.new('../pokemon.db')
@db.execute("DROP TABLE IF EXISTS pokemon;")
@sql_runner = SQLRunner.new(@db)
@sql_runner.execute_schema_migration_sql

# 
# require 'pry'
#
# class Pokemon
#   attr_accessor :name, :type, :db, :id
#   attr_reader :id
#   # @@db = SQLite3::Database.new('../pokemon.db')
#
#   def initialize(hash)
#     @name = hash[:name]
#     @type = hash[:type]
#     @db = hash[:db]
#     @id = hash[:id]
#   end
#
#
#   def self.save(name, type, db)
#     @db = db
#     sql = <<-SQL
#       INSERT INTO pokemon (name, type)
#       VALUES (?, ?)
#     SQL
#
#     @db.execute(sql, name, type)
#     @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
#
#   end
#
#   def self.find(id, db)
#     @db = db
#     sql = <<-SQL
#       SELECT * FROM pokemon WHERE id = ?
#     SQL
#
#     new_pokemon = @db.execute(sql, id)[0]
#     new_hash = {}
#     new_hash[:id] = new_pokemon[0]
#     new_hash[:name] = new_pokemon[1]
#     new_hash[:type] = new_pokemon[2]
#     new_hash[:db] = @db
#     pikachu = Pokemon.new(new_hash)
#   end
#
# end

# binding.pry
