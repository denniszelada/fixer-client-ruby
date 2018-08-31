#!/usr/bin/env ruby

ENV['RACK_ENV'] ||= 'development'
require ::File.expand_path('../config/environment', __FILE__)

require 'dotenv'
Dotenv.load

task :console do
  require ::File.expand_path('app/load', __dir__)
  require 'pry'
  ARGV.clear
  Pry.start
end

load 'tasks/db.rake'
