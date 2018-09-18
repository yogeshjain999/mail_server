class RemoveCreatedByFromMail < ActiveRecord::Migration[5.2]
  def change
    remove_column :mails, :created_by_id, :string
  end
end
