ENV['RACK_ENV'] ||= 'development'
load "models/init.rb"

Mongoid.logger.level = Logger::DEBUG
Mongoid.logger = Logger.new($stdout)
