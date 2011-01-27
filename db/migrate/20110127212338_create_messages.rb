class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :name
      t.string :target_name
      t.string :target_email
      t.text :body
      t.string :ip
      t.integer :status

      t.timestamps
    end

    add_index :messages, :target_name
    add_index :messages, :target_email
    add_index :messages, :status
  end

  def self.down
    drop_table :messages
  end
end
