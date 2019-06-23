class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include UUIDHelper

  before_validation :set_uuid, on: :create
end
