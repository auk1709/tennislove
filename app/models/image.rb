class Image < ApplicationRecord
  mount_uploader :content, ImgUploader
  belongs_to :topic_content, optional: true
end
