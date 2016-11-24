class Account < ActiveRecord::Base
  has_secure_password
  has_many :posts
end
