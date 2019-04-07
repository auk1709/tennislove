class TopicCategory < ApplicationRecord
  has_many :topics
  validates :name, presence: true
end
