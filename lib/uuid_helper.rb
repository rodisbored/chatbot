module UUIDHelper
  def set_uuid
    self.uuid = SecureRandom.uuid if self.has_attribute?(:uuid) && self.uuid.blank?
  end
end
