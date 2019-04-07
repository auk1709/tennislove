class User < ApplicationRecord
  before_save :initial_data_set, on: :create
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :topics
  has_many :topic_contents
  
  def initial_data_set
    self.email.downcase!  
    self.image_name = "default_user.jpg" unless image_name.present?
  end
end
