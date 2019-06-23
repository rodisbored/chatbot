class User < ApplicationRecord
  has_secure_password

  enum locale: { en: 0 }

  has_many :subcriptions

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
