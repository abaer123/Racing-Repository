require 'sinatra'
require 'sequel'
require 'sqlite3'

# database = Sequel.sqlite('development.sqlite')
database = SQLite3::Database.open "leaderboard.db"
database.execute "CREATE TABLE IF NOT EXISTS leaderboard(id primary_key, player varchar, time varchar, map varchar, date varchar)"

# TODO: primary key not being added by default
# dbname.execute 'INSERT INTO leaderboard (player, time, date) VALUES (?, ?)', address, asking_price
database.execute 'INSERT INTO leaderboard (player, time, map, date) VALUES (?, ?, ?, ?)', 'logan', '15:35', 'troll tunnel', '12/12/2012'

#  reference: https://github.com/al-kivi/puresong/blob/master/views/home.erb
results = database.query "SELECT * FROM leaderboard"

# results = database.execute("SELECT * FROM leaderboard").flatten
test = results.first
puts test
puts test.instance_of? Array
puts test.instance_of? Fixnum
puts test.instance_of? String


# puts '{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}'
# results.each do |i|
#     i.each do |x|
#         puts x
#         puts '-'
#     end
# end
# puts '{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}'

get '/' do
  @title = "Tanuki Racing Leaderboard"
  erb :index, :locals => {:results => results}
end

not_found do
  erb :not_found
end
