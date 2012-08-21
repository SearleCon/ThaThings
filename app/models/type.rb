class Type < ActiveRecord::Base
  has_many :things, dependent: :destroy 
  belongs_to :user
  
  validates :type_name, :presence => true
  
  validates :user_id, :presence => true
  
  # SHAUN, You added the below, to make sure that the Type Name is unique PER USER
  validate :type_name_unique_per_user

  def type_name_unique_per_user
    if Type.exists?( :type_name =>  self.type_name, :user_id => self.user_id )
       errors.add( :type_name, 'You already have a Type with this name!')
    end
  end

end