class Thing < ActiveRecord::Base
  has_many :notes
  belongs_to :type
  
  validates :short_name, :presence => true  
end
