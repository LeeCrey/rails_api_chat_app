# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  respond_to :json

  # POST /resource/sign_in
  def create
    token = request.headers["GoogleToken"]
    if token.blank?
      super
    else
      authenticate_with_google_token(token)
    end
  end

  private

  include SessionsConcern
end
