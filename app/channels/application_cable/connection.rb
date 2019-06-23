module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    # Get current user and use for channels
    def connect
      self.current_user = find_verified_user
    end

    private
    def find_verified_user
      User.find_by(id: @current_user&.id) || reject_unauthorized_connection
    end
  end
end
