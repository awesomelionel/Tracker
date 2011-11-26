class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_attached_file :asset
  validates :title, :presence => true 
  validates :description, :presence => true, :length => {:minimum => 10}
  
  has_many :comments
end
