class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    result = run Session::Create do
      return render_success(data: { token: @model.token })
    end

    render_errors(errors: result[:errors])
  end
end
