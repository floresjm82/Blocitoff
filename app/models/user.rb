class User < ActiveRecord::Base

  before_save do
    self.email = email.downcase
    self.role ||= :member
    self.name = (name.split.each { |n| n.capitalize!}).join(" ") unless name.blank?
  end

  before_create :generate_auth_token

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z]+\z/i

  validates :name, length: {minimum: 1, maximum: 25}, presence: true
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
  validates :password, length: {minimum: 6}, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minmum: 3, maximum: 100},
            format: {with: EMAIL_REGEX}

  has_secure_password

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
  

end
