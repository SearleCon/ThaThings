class Type < ActiveRecord::Base
  has_many :things, dependent: :destroy 
  
  validates :type_name, :presence => true

end
