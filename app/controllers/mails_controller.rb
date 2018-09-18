class MailsController < ApplicationController
  def index
    run Mail::Index do |result|
      return render_success(data: result[:mails])
    end
  end

  def create
    run Mail::Create do
      return render_success(data: @model)
    end

    render_errors(errors: @form.errors)
  end

  def update
    run Mail::Update do
      return render_success(data: @model)
    end

    render_errors(errors: @_result[:errors])
  end

  def destroy
    run Mail::Destroy do |result|
      return render_success
    end

    render_errors(errors: @_result[:errors])
  end
end
