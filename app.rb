require 'sinatra'
require 'sequel'
require 'sqlite3'

# database = Sequel.sqlite('development.sqlite')
database = SQLite3::Database.open "leaderboard.db"
database.execute "CREATE TABLE IF NOT EXISTS leaderboard(id primary_key, player varchar, time varchar, map varchar, date varchar)"
query = 'INSERT INTO leaderboard (player, time, map, date) VALUES (?, ?, ?, ?)'
database.execute query, 'Logan Stucker', '477', 'Woodland Whirlwind Run', '2023-02-21'
database.execute query, 'John Doe', '122', 'Canyon Chase Challenge', '2023-02-23'
database.execute query, 'Sarah Johnson', '321', 'Rainforest Rally Run', '2023-03-01'
database.execute query, 'Michael Smith', '236', 'Urban Jungle Grand Prix', '2023-03-07'
database.execute query, 'Emily Davis', '745', 'Tundra Turbo Trails', '2023-04-27'
database.execute query, 'Daniel Wilson', '233', 'Mountain Mayhem Course', '2023-05-11'
database.execute query, 'Olivia Brown', '333', 'Desert Dash Circuit', '2023-05-14'
database.execute query, 'James Lee', '521', 'Tundra Turbo Trails', '2023-07-01'
database.execute query, 'William Martin', '511', 'Jungle Jamboree Track', '2023-07-07'
database.execute query, 'Benjamin White', '426', 'Ocean Odyssey Speedway', '2023-08-28'
database.execute query, 'Sophia Anderson', '499', 'Desert Dash Circuit', '2023-09-12'
# TODO: primary key not being added by default
# dbname.execute 'INSERT INTO leaderboard (player, time, date) VALUES (?, ?)', 'address', 'asking_price'


# <% results.each do |lp|  %>
#   <% lp.each do |x|  %>
#       <%= x %>
#   <%  end  %>
#   |||
#   <%  end  %>

# puts '{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}'
# results.each do |i|
#   puts i[1]
#   puts i[2]
#   puts i[3]
#   puts i[4]
# end
# puts '{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}'

get '/' do
  @title = "Tanuki Racing Home"
  erb :index, :locals => {}
end

get '/leaderboard' do
  @title = "Tanuki Racing Leaderboard"
  results = database.query "SELECT * FROM leaderboard"
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

  # add_entry(player, time, map, date)
  @title = "Tanuki Racing Edit"
  database.execute 'INSERT INTO leaderboard (player, time, map, date) VALUES (?, ?, ?, ?)', player, time, map, date
  # results = database.query "SELECT * FROM leaderboard"
  # erb :leaderboard, :locals => {:results => results}
  redirect '/leaderboard'
end

get '/about' do
  @title = "Tanuki Racing About"
  erb :about, :locals => {}
end

not_found do
  erb :not_found
end

def add_entry(player, time, map, date)
  database.execute "INSERT INTO leaderboard (player, time, map, date) VALUES (?,?,?,?)", player, time, map, date
end
