class DispatchController < ApplicationController
  def create
    run Mail::Dispatch do
      return render_success
    end

    render_errors(errors: @_result[:errors])
  end
end
