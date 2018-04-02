class CreateMessageTags < ActiveRecord::Migration[5.2]
  def change
    create_table :message_tags do |t|
      t.integer :message_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end

    add_foreign_key :message_tags, :messages, on_delete: :cascade
    add_foreign_key :message_tags, :tags, on_delete: :cascade
  end
end
