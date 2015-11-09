class Bookmark
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  include Mongoid::Timestamps::Created

  field :title, type: String
  field :link, type: String
  field :archive, type: String
  field :posted_at, :type => DateTime, :default => lambda{ Time.now }

  default_scope -> { order(:posted_at.desc) }

  validates_presence_of :link

  def archive_link
    self.archive || self.link
  end
end
