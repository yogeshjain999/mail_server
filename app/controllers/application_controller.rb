class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!

  private

  def authenticate_user!
    payload = JWT.decode(request.headers['Authorization'], Rails.application.secret_key_base)
    sign_in User.find(payload.first['id'])
  rescue JWT::DecodeError, JWT::ExpiredSignature, ActiveRecord::RecordNotFound
    render_errors(errors: ['Invalid Token'])
  end

  def render_success(data: {}, status: 200)
    render json: { data: data }, status: status
  end

  def render_errors(errors: {}, status: 422)
    render json: { errors: errors }, status: status
  end

  def _run_options(options)
    options.merge(current_user: current_user)
  end
end
