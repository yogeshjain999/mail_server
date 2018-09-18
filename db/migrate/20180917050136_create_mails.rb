class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.string :subject
      t.string :body
      t.string :status
      t.string :to
      t.string :from
      t.integer :created_by_id

      t.timestamps
    end
  end
end
