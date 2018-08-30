# frozen_string_literal: true

ENVIRONMENT = ENV['RACK_ENV'] || 'development'
ROOT_PATH = File.dirname(__dir__)
$LOAD_PATH.unshift ROOT_PATH

## boot
require 'rubygems'
require 'bundler'

Bundler.setup(:default, ENVIRONMENT)
