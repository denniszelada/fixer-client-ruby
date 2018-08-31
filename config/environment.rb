# frozen_string_literal: true

ENVIRONMENT = ENV['RACK_ENV'] || 'development'
ROOT_PATH = File.dirname(__dir__)
$LOAD_PATH.unshift ROOT_PATH

## boot
require 'rubygems'
require 'bundler'

# dotenv
require 'dotenv'
Dotenv.load

Bundler.setup(:default, ENVIRONMENT)

require_relative './settings'

# initialize
Dir[File.join(__dir__, 'initializers', '*.rb')].sort.each do |file|
  require(file)
end

