class CreateMessageRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :message_recipients do |t|
      t.integer :message_id, null: false
      t.integer :recipient_id, null: false
      t.integer :recipient_type, null: false
      t.string :name

      t.timestamps
    end

    add_foreign_key :message_recipients, :messages, on_delete: :cascade
    add_foreign_key :message_recipients, :recipients, on_delete: :cascade
  end
end
