class Type < ActiveRecord::Base
  has_many :things, dependent: :destroy 
  belongs_to :user
  
  validates :type_name, :presence => true
  
  validates :user_id, :presence => true # SHAUN, decide if this should be here, as it is a hidden field. This is for testing purposes for now
end