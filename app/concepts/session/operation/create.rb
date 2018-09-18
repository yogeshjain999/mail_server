class Session::Create < Trailblazer::Operation
  step :load_user
  failure :log_invalid_login, fail_fast: true
  step :validate_password
  failure :log_invalid_login

  def load_user(options, params:, **)
    options[:model] = User.find_by(email: params.dig(:user, :email))
  end

  def validate_password(options, model:, params:, **)
    model.valid_password?(params.dig(:user, :password))
  end

  def log_invalid_login(options, **)
    options[:errors] = ['Invalid Credentails']
  end
end
