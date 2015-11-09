json.array! @entries.each do |entry|
  json.(entry, :title, :archive_link, :link, :posted_at)
end
