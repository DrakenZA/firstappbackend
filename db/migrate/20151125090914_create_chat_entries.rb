class CreateChatEntries < ActiveRecord::Migration
  def change
    create_table :chat_entries do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
