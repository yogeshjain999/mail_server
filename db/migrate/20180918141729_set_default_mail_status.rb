class SetDefaultMailStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :mails, :status, :string, default: 'draft'
  end
end
