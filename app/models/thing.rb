class Thing < ActiveRecord::Base
  has_many :notes
  belongs_to :type
  belongs_to :user
  
  validates :short_name, :presence => true  
end