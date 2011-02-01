class Message < ActiveRecord::Base

  validates_presence_of :name, :target_name, :target_email, :body, :terms_conditions

  validates_length_of :name,        :minimum => 3
  validates_length_of :target_name, :minimum => 3
  validates_length_of :body,        :minimum => 5, :maximum => 140

  validates_format_of :target_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'Nieprawidłowy zapis email'

  before_create :make_permalink

private

  def make_permalink
    tmp, i = target_email.gsub(/\W/, '_'), 1
    while Message.where(:permalink => "#{tmp}#{i > 1 ? i : ''}").count > 0
      i += 1
    end
    self.permalink = "#{tmp}#{i > 1 ? i : ''}"
  end

end
