class Post < ApplicationRecord
    mount_uploader :picture_id, PowerStoneImageUploader
    belongs_to :user

    validates :title, presence: true, length: { maximum: 255 }
    validates :content, presence: true, length: { maximum: 10_535 }
end
