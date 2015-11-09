require 'rss'
require 'net/http'
require 'uri'
require_relative 'models/init'

post_uri = URI.parse('https://archive.is/submit/')
rss = RSS::Parser.parse('http://b.hatena.ne.jp/search/tag?safe=on&q=%E7%82%8E%E4%B8%8A&mode=rss&users=3')
rss.items.each do |item|
  begin
    link = URI.escape(item.link)
    unless Bookmark.where(link: link).exists?
      res = Net::HTTP.post_form(post_uri, {run: 1, url: link})
      archive = res['location']
      Bookmark.create(title: item.title, link: link, archive: archive, posted_at: item.dc_date)
    end
  rescue => e
    puts e.message
    puts e.backtrace.inspect
  end
end
