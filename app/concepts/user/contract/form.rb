module User::Contract
  class Form < Reform::Form
    property :email
    property :password
    property :password_confirmation
  end
end
