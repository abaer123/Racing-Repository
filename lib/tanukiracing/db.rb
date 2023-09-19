# frozen_string_literal: true
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'leaderboard.db')

module TanukiRacing
  class DB

    def self.initialize(filename)
      @filename = filename
      @db = SQLite3::Database.open(filename)
    end

    def self.create_table
      @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS leaderboards(id primary_key, player varchar, time varchar, map varchar, date varchar)
      SQL
    end

    def self.add_leader(player, time, map, date)
        # racer = Racer.new
        # racer.player = player
        # racer.time = time
        # racer.map = map
        # racer.date = date
        # puts racer
        Leaderboard.create(player: player, time: time, map: map, date: date)
        # @db.execute 'INSERT INTO leaderboard (player, time, map, date) VALUES (?, ?, ?, ?)', player, time, map, date
    end

    def self.get_leaders(id)
      # @db.execute("SELECT * FROM leaders AND id = #{id}")
      Leaderboard.all
    end

    def self.get_all
      Leaderboard.all
    end

    def self.get_specific(id)
      Leaderboard.first.where("player = '" + id + "'")
    end
  end

  class Leaderboard < ActiveRecord::Base
  end
end