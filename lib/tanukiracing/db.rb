# frozen_string_literal: true
require 'sqlite3'

module TanukiRacing
  class DB
    def self.initialize(filename)
      @filename = filename
      @db = SQLite3::Database.open(filename)
    end

    def self.create_table
      @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS leaderboard(id primary_key, player varchar, time varchar, map varchar, date varchar)
      SQL
    end

    def self.add_leader(player, time, map, date)
        @db.execute 'INSERT INTO leaderboard (player, time, map, date) VALUES (?, ?, ?, ?)', player, time, map, date
    end

    def self.get_leaders(id)
      @db.execute("SELECT * FROM leaders AND id = #{id}")
    end

    def self.get_all
        @db.execute("SELECT * FROM leaderboard")
    end

    def delete_player(id)
      @db.execute("DELETE FROM leaderboard WHERE id = #{id}")
    end
  end
end