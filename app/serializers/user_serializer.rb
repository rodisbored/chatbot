class UserSerializer < ApplicationSerializer
  attributes :username, :email, :first_name, :last_name, :locale, :uuid
end
