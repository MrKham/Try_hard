class User < ApplicationRecord
  before_save :email_was

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,
    length: {maximum: Settings.valid.user_email.length_max},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.valid.user_password.length_min}
  validates :name, presence: true,
    length: {maximum: Settings.valid.user_name.length_max}

  has_secure_password

  private

  def email_was
    email.downcase!
  end
end
