class Datapoint < ActiveRecord::Base
  belongs_to :user
  belongs_to :tracker
  validates :amount, presence: true
end
