class Video < ApplicationRecord
  acts_as_taggable_on :tags
  validates :title,       presence: true, length: { maximum: 50}
  validates :youtube_url, presence: true
  validates :tag_list,    presence: true
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end
