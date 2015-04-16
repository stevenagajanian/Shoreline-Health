class Immunization < ActiveRecord::Base
  belongs_to :user
  has_many :photos, :dependent => :destroy
  
  def date
    if self.date_occured != nil
      return date_occured
    else
      return created_at
    end
  end
  
  def self.date_occured
    if self.date_occured == nil
      return self.created_at
    end
  end
  
end
