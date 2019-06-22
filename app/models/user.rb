class User < ApplicationRecord
  enum locale: { en: 0 }

  has_many :subcriptions


end
