# frozen_string_literal: true
require 'sqlite3'

module TanukiRacing
  class DB
    def initialize(filename)
      @filename = filename
      @db = SQLite3::Database.new(filename)
    end

    def create_table
      @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS leaderboard(id primary_key, player varchar, time varchar, map varchar, date varchar)
      SQL
    end

    def add_leader(player, time, map, date)
      @db.execute("INSERT INTO leaderboard (player, time, map, date) VALUES (#{player}, #{time}, #{map}, #{date})")
    end

    def get_leaders(id)
      @db.execute("SELECT * FROM leaders AND id = #{id}")
    end

    def delete_player(id)
      @db.execute("DELETE FROM leaderboard WHERE id = #{id}")
    end
  end
end