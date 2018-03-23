class User < ActiveRecord::Base
  has_many :accounts
  has_many :stocks, through: :accounts

  has_secure_password   #validates password field isn't blank and password length < 73 characters
  validates_presence_of :username, :email, :password
  validates :username, uniqueness: true

  def slug  #substitutes special characters in username with dashes in url
    self.username.gsub(/[!?,'." "]/, '-').downcase
  end

  def self.find_by_slug(slug) #finds username with url modifier
    User.all.find do |user|
      user.slug == slug
    end
  end
end
