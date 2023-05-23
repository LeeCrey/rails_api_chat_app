# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_json_error(exception.message, :not_found)
  end

  rescue_from ArgumentError,
              ActionDispatch::Http::Parameters::ParseError do |exception|
    render_json_error(exception.message, :internal_server_error)
  end

  rescue_from ActionController::ParameterMissing do |ex|
    render_json_error(ex.message, :bad_request)
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |ex|
    msg = "Cannot delete record because of retriction."

    render_json_error(msg, :internal_server_error)
  end

  rescue_from Pundit::NotAuthorizedError,
              ActionController::InvalidAuthenticityToken do |ex|
    render_json_error(ex.message, :unauthorized)
  end

  def not_found
    render_json_error("Page not found", :not_found)
  end

  protected

  def render_success(params = {})
    status = params.delete(:status)
    json = { okay: true }.merge(params)

    render json: json, status: status
  end

  def render_json_error(msg, status)
    render json: { okay: false, reason: msg }, status: status
  end

  def render_created(msg)
    render json: { okay: true }.merge(msg), status: :created
  end
end
