class Chef < ActiveRecord::Base
  has_many :recipes
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :chefname, presence: true, length: {minimum: 5, maximum: 20}
  validates :email, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}
end