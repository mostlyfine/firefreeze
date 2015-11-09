require "bundler"
Bundler.require
load "models/init.rb"

get "/" do
  @entries = Bookmark.limit(100)
  slim :index
end

get "/list.json" do
  max = params[:limit] || 100
  @entries = Bookmark.limit(max)
  jbuilder :list
end
