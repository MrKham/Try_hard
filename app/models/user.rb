class User < ApplicationRecord
<<<<<<< 8aa6ac46ac9fd6a11b2f35a093379eef0b5606f4
  attr_reader :remember_token, :activation_token, :reset_token
=======
  attr_reader :remember_token, :activation_token
>>>>>>> account activated

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,
    length: {maximum: Settings.valid.user_email.length_max},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.valid.user_password.length_min}, allow_nil: true
  validates :name, presence: true,
    length: {maximum: Settings.valid.user_name.length_max}

<<<<<<< 8aa6ac46ac9fd6a11b2f35a093379eef0b5606f4
  before_save   :downcase_email
=======
  before_save :downcase_email
>>>>>>> account activated
  before_create :create_activation_digest

  def self.digest string
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create string, cost: cost
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    @remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.blank?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attributes remember_digest: nil
  end

  def current_user? user
    self == user
  end

  def activate
    update_attributes activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

<<<<<<< 8aa6ac46ac9fd6a11b2f35a093379eef0b5606f4
  def create_reset_digest
    @reset_token = User.new_token
    update_attributes reset_digest: User.digest(reset_token)
    update_attributes reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

=======
>>>>>>> account activated
  private

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    @activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
