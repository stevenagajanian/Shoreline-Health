class Droplet < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  
  validates :body, presence: true
  validates :user_id, presence: true
  validates :page_id, presence: true
  
  auto_html_for :body do
    html_escape
    sized_imagee
    youtube(:width => 400, :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
