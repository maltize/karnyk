class AddTermsCondToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :terms_conditions, :boolean
  end

  def self.down
    remove_column :messages, :terms_conditions
  end
end
