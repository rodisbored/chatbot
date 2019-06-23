class User < ApplicationRecord
  enum locale: { en: 0 }

  has_many :subcriptions

  validates_presence_of :username, :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  attr_accessor :password

  before_save :encrypt_password

  def encrypt_password
    # Encrypt password before saving
  end
end
