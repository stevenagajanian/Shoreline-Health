class Notification < ActiveRecord::Base
  belongs_to :user
  
  def mark_as_read
    update_attribute(:b_read, true)
  end
end
