class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    run User::Create do
      return render_success(data: { token: @model.token })
    end

    render_errors(errors: @model.errors)
  end
end
