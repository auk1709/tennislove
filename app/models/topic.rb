class Topic < ApplicationRecord
  belongs_to :topic_category
  belongs_to :user
  has_many :topic_contents
  validates :title, presence: true
  validates :content, presence: true
end
