# frozen_string_literal: true

module SessionsConcern
  def current_token
    request.env["warden-jwt_auth.token"]
  end

  # LOGOUT
  def respond_to_on_destroy
    if user_signed_in?
      render_success({ message: t("devise.sessions.signed_out") })
    else
      render_json_error("Un-Authorized request.", :unauthorized)
    end
  end

  # LOGIN
  def respond_with(resource, _opt = {})
    if student_signed_in?
      login_success
    else
      render_json_error(t("devise.failure.invalid"), :unauthorized)
    end
  end

  #
  def authenticate_with_google_token(token)
    begin
      client_id = ENV.fetch("GOOGLE_AUTH_CLIENT_ID")
      payload = Google::Auth::IDTokens.verify_oidc(token, aud: client_id)
      if payload["aud"] != client_id
        render_json_error("Invalid token", :unauthorized)
      else
        self.resource = Student.from_token(payload)
        sign_in(resource_name, resource)

        login_success
      end
    rescue => e
      render_json_error(e.to_s, :unauthorized)
    end
  end

  def login_success
    hash = { message: t("devise.sessions.signed_in") }

    render_success(hash)
  end
end
