class Message < ActiveRecord::Base

  validates_presence_of :name, :target_name, :target_email, :body

  validates_length_of :name, :minimum => 3
  validates_length_of :target_name, :minimum => 3
  validates_length_of :body, :minimum => 5
  validates_presence_of :terms_conditions

  validates_format_of :target_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'Nieprawidłowy zapis email'

end
