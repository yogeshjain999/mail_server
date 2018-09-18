class Mail::Create < Trailblazer::Operation
  step Model(Mail, :new)
  success :assign_current_user!
  step Contract::Build(constant: Mail::Contract::Form)
  step Contract::Validate(key: :mail)
  step Contract::Persist()

  def assign_current_user!(options, current_user:, **)
    options[:model].user = current_user
  end
end
