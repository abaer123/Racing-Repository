# require "rake"
# require "rake/clean"
# require 'rake/testtask'

# task :default => :test

# Rake::TestTask.new do |t|
#   t.warning = true
# end


require 'tanukiracing'
require 'test/unit'
require 'rack/test'
require 'rake/testtask'

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