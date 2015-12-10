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

  validates :name, length: {minimum: 1, maximum: 25}, presence: true




end
