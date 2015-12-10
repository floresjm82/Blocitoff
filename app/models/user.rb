class User < ActiveRecord::Base

  has_many :items, dependent: :destroy 


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save do
    self.email = email.downcase
    self.name = (name.split.each { |n| n.capitalize!}).join(" ") unless name.blank?
  end


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i

  validates :name, length: {minimum: 1, maximum: 25}, presence: true
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
  validates :password, length: {minimum: 6}, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minmum: 3, maximum: 100},
            format: {with: EMAIL_REGEX}

  has_secure_password



end
