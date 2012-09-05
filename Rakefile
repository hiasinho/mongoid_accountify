# encoding: utf-8

require 'rubygems'

begin
  require 'bundler'
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'
require 'jeweler'

$:.push File.expand_path('../lib', __FILE__)
require 'mongoid/accountify/version'

Jeweler::Tasks.new do |gem|
  gem.name = 'mongoid_accountify'
  gem.version = Mongoid::Accountify::Version::STRING
  gem.homepage = 'https://github.com/hiasinho/mongoid_accountify'
  gem.license = 'MIT'
  gem.summary = %Q{Account related models within mongoid}
  gem.email = 'hiasinho@me.com'
  gem.authors = ['Mathias Schneider']
end

Jeweler::RubygemsDotOrgTasks.new

task :default => :version
