class User < ActiveRecord::Base

  USERNAME_REGEX = /\A[a-zA-Z][a-zA-Z0-9_]*\z/
  BLACKLISTED_USERNAMES = %w(admin root 50cents pages posts replies users
  profile reports votes)

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_one :profile, dependent: :destroy
  has_many :posts,  dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true, allow_nil: true, length: 2..32

  validates :username,
    format:    { with: USERNAME_REGEX, allow_nil: true, message: 'can only contain alphabets and numbers' },
    exclusion: { in: BLACKLISTED_USERNAMES, message: 'this username is not available' }

  validates :username, uniqueness: true, presence: true, allow_nil: true, length: 3..32
end
