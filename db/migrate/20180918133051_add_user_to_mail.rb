class AddUserToMail < ActiveRecord::Migration[5.2]
  def change
    add_reference :mails, :user, foreign_key: true
  end
end
