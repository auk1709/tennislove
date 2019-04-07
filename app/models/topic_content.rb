class TopicContent < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :images
  validates :content, presence: true
  validates :user_name, presence: true
  accepts_nested_attributes_for :images
end
