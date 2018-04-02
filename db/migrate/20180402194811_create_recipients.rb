class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.string :email, null: false
      t.string :name
    end

    add_index :recipients, :email, unique: true
  end
end
