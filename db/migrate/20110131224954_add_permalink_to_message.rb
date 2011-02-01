class AddPermalinkToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :permalink, :string

    add_index :messages, :permalink
  end

  def self.down
    remove_column :messages, :permalink
  end
end
