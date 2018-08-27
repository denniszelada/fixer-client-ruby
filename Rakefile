#!/usr/bin/env ruby

appdir = File.expand_path(File.join(File.dirname(__FILE__), 'app'))
$LOAD_PATH.unshift(appdir) unless $LOAD_PATH.include?(appdir)

ENV['RACK_ENV'] ||= 'development'

require 'fixer'

task :console do
  require 'pry'
  ARGV.clear
  Pry.start
end
