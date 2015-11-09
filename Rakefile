desc 'Run rack server'
task :server do
  sh "bundle exec rerun 'rackup config.ru -o 0.0.0.0 -p 4567'"
end

desc 'Run batch application'
task :batch do
  sh "bundle exec ruby batch.rb"
end

desc "Run command line interface"
task :console do
  sh "bundle exec pry"
end

