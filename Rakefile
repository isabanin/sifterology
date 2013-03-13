require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'jeweler'
require 'rake'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "sifterology"
  gem.homepage = "http://github.com/iSabanin/sifterology"
  gem.license = "MIT"
  gem.summary = "Quick and dirty API wrapper for Sifter app."
  gem.description = "Yeah, that's true."
  gem.email = "ilya.sabanin@gmail.com"
  gem.authors = ["Ilya Sabanin"]
  gem.add_dependency "httparty", ">= 0.5"
  gem.add_dependency "json", ">= 1.4.6"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test
