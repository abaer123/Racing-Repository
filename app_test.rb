require './app.rb'
require 'test/unit'
require 'rack/test'

set :environment, :test

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_leaderboard
    get '/'
    assert last_response.ok?
    assert_include last_response.body, 'Tanuki Racing Leaderboard'
  end
end