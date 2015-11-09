require "mongoid"

ENV['RACK_ENV'] ||= 'development'
Mongoid.load!(File.expand_path(File.join('config', 'mongoid.yml')), ENV['RACK_ENV'].to_sym)

require_relative "bookmark"
