class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_one :profile, dependent: :destroy
  has_many :posts,  dependent: :destroy
end
