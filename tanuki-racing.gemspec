# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require "tanukiracing/version"

Gem::Specification.new do |s|
  s.name = "tanukiracing"
  s.version = TanukiRacing::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Logan Stucker"]
  s.email = ["lstucker@gitlab.com"]
  s.homepage = "https://gitlab.com/gitlab-learn-labs/webinars/tanuki-racing/tanuki-racing-application"
  s.summary = "One Demo To Rule Them All"

  s.require_paths = ["lib"]
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = ["tanukiracing"]
  s.required_ruby_version = '~> 3.1'


  s.add_runtime_dependency 'sequel', '~> 5.72.0'
  s.add_runtime_dependency 'sinatra', '~> 3.1.0'
  s.add_runtime_dependency 'webrick', '~> 1.8.1'
  s.add_runtime_dependency 'sqlite3', '~> 1.6.6'
  s.add_runtime_dependency 'test-unit', '~> 3.6.1'
  s.add_runtime_dependency 'activerecord', '~> 7.0.8'

  s.add_development_dependency 'rake', '~> 13.0.6'
  s.add_development_dependency 'rack', '~> 2.2.8'
  s.add_development_dependency 'rack-test', '~> 2.1.0'
  s.add_development_dependency 'rubocop', '~> 1.56.3'
end