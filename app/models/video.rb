class Video < ApplicationRecord
  acts_as_taggable_on :tags
  validates :title,     presence: true
  validates :youtube_url,     presence: true
  validates :tag_list,     presence: true
  belongs_to :user
end
