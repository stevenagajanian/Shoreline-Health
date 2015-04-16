class Condition < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  belongs_to :page
  has_many :medications, through: :trackers
  has_many :trackers
  has_many :photos, :dependent => :destroy
  #has_many :sages, 
  validates :name, presence: true

  def self.search(search)
    where('name LIKE?', "%#{search}%")
  end
  
  
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
  
  def page_name
    if (page_id)
      @page = Page.find(page_id)
      return @page.name
    else
      "none"
    end
  end
end
