require "rake"
require "rake/clean"
require 'rake/testtask'
require 'tanukiracing'
require 'test/unit'
require 'rack/test'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TanukiRacing::App
  end

  def test_leaderboard
    get '/'
    assert last_response.ok?
    assert_include last_response.body, 'Tanuki Racing Leaderboard'
  end
end