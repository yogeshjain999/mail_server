class Mail::Destroy < Trailblazer::Operation
  step Model(Mail, :find_by)
  failure :abort!, fail_fast: true
  step :destroy!

  def abort!(options, **)
    options[:errors] = ['Mail Not Found']
  end

  def destroy!(options, model:, **)
    model.update status: 'trash'
  end
end
