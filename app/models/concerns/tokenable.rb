module Tokenable
  extend ActiveSupport::Concern

  def token(exp: 5.hour.from_now)
    payload = { id: id, exp: exp.to_i }
    JWT.encode(payload, Rails.application.secret_key_base)
  end 
end
