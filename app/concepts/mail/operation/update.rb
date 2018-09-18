class Mail::Update < Trailblazer::Operation
  step Model(Mail, :find_by)
  failure :abort!, fail_fast: true
  step Contract::Build(constant: Mail::Contract::Form)
  step Contract::Validate(key: :mail)
  step Contract::Persist()

  def abort!(options, **)
    options[:errors] = ['Mail Not Found']
  end
end
