class User::Create < Trailblazer::Operation
  step Model(User, :new)
  step Contract::Build(constant: User::Contract::Form)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
