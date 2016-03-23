require 'rss'
require 'net/http'
require 'uri'
require 'open-uri'
require_relative 'models/init'

post_uri = URI.parse('https://archive.is/submit/')
body = open("http://b.hatena.ne.jp/search/tag?safe=off&q=%E7%82%8E%E4%B8%8A|%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB&mode=rss&users=3", 'User-Agent' => 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)').read
rss = RSS::Parser.parse(body)
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
