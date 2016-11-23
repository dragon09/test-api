require 'carrierwave/orm/activerecord' 
class Image < ActiveRecord::Base
  belongs_to :post
  mount_uploader  :src, ImageUploader
end
