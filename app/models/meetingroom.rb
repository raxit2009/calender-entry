class Meetingroom < ActiveRecord::Base
  
  validates_uniqueness_of :name
  validates_presence_of :name, :allow_nil => true
end
