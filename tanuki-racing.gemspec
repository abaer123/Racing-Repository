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


  s.add_runtime_dependency 'sequel'
  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'webrick'
  s.add_runtime_dependency 'sqlite3'
  s.add_runtime_dependency 'test-unit'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rack'
  s.add_development_dependency 'rack-test'
#   s.add_development_dependency 'puma'
  s.add_development_dependency 'rubocop'
end