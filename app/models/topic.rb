class Topic < ApplicationRecord
  has_many :subscriptions

  belong_to :group
end
