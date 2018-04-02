class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :from, null: false
      t.string :from_name

      t.text :subject
      t.text :headers, null: false, default: '{}'

      t.text :html_content
      t.text :content

      t.timestamps
    end
  end
end
