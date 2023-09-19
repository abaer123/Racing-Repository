# frozen_string_literal: true
require 'sinatra'
require 'sequel'
require 'sqlite3'
require_relative 'db'

# frozen_string_literal: true

module TanukiRacing
  # Sinatra application
  class App < Sinatra::Base

    set :logging, true
    set :static, true
    set :public_dir, File.expand_path('static', __dir__)
    set :views, File.expand_path('views', __dir__)
    set :player_test, 'test'

    aws_key_id = "AKIAIOSF0DNN7EXAMPLE"

    TanukiRacing::DB.initialize("leaderboard.db")
    TanukiRacing::DB.create_table
    TanukiRacing::DB.add_leader('Logan Stucker', '477', 'Woodland Whirlwind Run', '2023-02-21')
    TanukiRacing::DB.add_leader('John Doe', '122', 'Canyon Chase Challenge', '2023-02-23')
    TanukiRacing::DB.add_leader('Sarah Johnson', '321', 'Rainforest Rally Run', '2023-03-01')
    TanukiRacing::DB.add_leader('Michael Smith', '236', 'Urban Jungle Grand Prix', '2023-03-07')
    TanukiRacing::DB.add_leader('Emily Davis', '745', 'Tundra Turbo Trails', '2023-04-27')
    TanukiRacing::DB.add_leader('Daniel Wilson', '233', 'Mountain Mayhem Course', '2023-05-11')
    TanukiRacing::DB.add_leader('Olivia Brown', '333', 'Desert Dash Circuit', '2023-05-14')
    TanukiRacing::DB.add_leader('James Lee', '521', 'Tundra Turbo Trails', '2023-07-01')
    TanukiRacing::DB.add_leader('William Martin', '511', 'Jungle Jamboree Track', '2023-07-07')
    TanukiRacing::DB.add_leader('Benjamin White', '426', 'Ocean Odyssey Speedway', '2023-08-28')
    TanukiRacing::DB.add_leader('Sophia Anderson', '499', 'Desert Dash Circuit', '2023-09-12')

    get '/' do
      @title = "Tanuki Racing Home"
      erb :index, :locals => {}
    end

    get '/leaderboard' do
      @title = "Tanuki Racing Leaderboard"
      results = TanukiRacing::DB.get_all
      erb :leaderboard, :locals => {:results => results}
    end

    get '/edit' do
      @title = "Tanuki Racing Edit"
      erb :edit, :locals => {}
    end

    post '/edit_board' do
      request_body = JSON.parse(request.body.read)
      player = request_body['player']
      time = request_body['time']
      map = request_body['map']
      date = request_body['date']

      @title = "Tanuki Racing Edit"
      TanukiRacing::DB.add_leader(player, time, map, date)
      redirect '/leaderboard'
    end

    get '/about' do
      @title = "Tanuki Racing About"
      erb :about, :locals => {}
    end

    not_found do
      erb :not_found
    end

  end
end

