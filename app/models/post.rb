class Post < ApplicationRecord
    mount_uploader :picture_id, PowerStoneImageUploader
    belongs_to :user
end
