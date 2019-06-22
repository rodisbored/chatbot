class User < ApplicationRecord
  enum locale: { en: 0 }

  has_many :subcriptions

  validates_presence_of :uuid, :username, :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
