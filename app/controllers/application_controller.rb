class ApplicationController < ActionController::API
  # Need authentication module

  protect_from_forgery with: :exception
end
