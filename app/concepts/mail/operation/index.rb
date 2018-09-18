class Mail::Index < Trailblazer::Operation
  step :load_mails

  def load_mails(options, params:, current_user:, **)
    options[:mails] = current_user.mails.where(status: params[:status])
  end
end
