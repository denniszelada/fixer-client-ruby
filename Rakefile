#!/usr/bin/env ruby

# appdir = File.expand_path(File.join(File.dirname(__FILE__), 'app'))
# $LOAD_PATH.unshift(appdir) unless $LOAD_PATH.include?(appdir)

ENV['RACK_ENV'] ||= 'development'
require ::File.expand_path('../config/environment', __FILE__)

# require 'load'

task :console do
  require ::File.expand_path('app/load', __dir__)
  require 'pry'
  ARGV.clear
  Pry.start
end
