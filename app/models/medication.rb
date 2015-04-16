class Medication < ActiveRecord::Base
  belongs_to :user
  belongs_to :condition
  has_many :photos, :dependent => :destroy
  has_many :pharmacies
  validates :name, presence: true
  
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
  
  def self.search(search)
    where('name LIKE?', "%#{search}%")
  end

end
