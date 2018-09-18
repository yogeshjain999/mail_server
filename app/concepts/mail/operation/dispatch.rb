class Mail::Dispatch < Trailblazer::Operation
  step :load_model
  failure :abort!, fail_fast: true

  success :load_receiver
  success :dispatch!

  def load_model(options, params:, **)
    options[:model] = Mail.find_by(id: params[:mail_id])
  end

  def abort!(options, **)
    options[:errors] = ['Mail Not Found']
  end

  def load_receiver(options, params:, **)
    options[:receiver] = User.where(email: options[:model].to).first
  end
  
  def dispatch!(options, receiver: nil, **)
    mail = options[:model]
    mail.update status: 'sent'

    if receiver
      receiver.mails.create(
        subject: mail.subject,
        body: mail.body,
        status: 'inbox',
        from: mail.user.email
      )
    end
  end
end
