class Mail::Contract::Form < Reform::Form
  property :subject
  property :body
  property :to

  validates :subject, :body, :to, presence: true
end
