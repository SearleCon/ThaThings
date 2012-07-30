class Thing < ActiveRecord::Base
  has_many :notes
  belongs_to :type
  belongs_to :user
  
  validates :short_name, :presence => true  
  
  # SHAUN SEARCH
  def self.search(search)
    if search
      find(:all, :conditions => ['short_name LIKE ? or long_name LIKE ?', "%#{search}%", "%#{search}%"])
#      find(:all, :conditions => ['short_name LIKE ? or long_name LIKE ? or type_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
#      find(:all, :conditions => ['(short_name LIKE ? or long_name LIKE ?) or (type_id LIKE (select id from types where id = ?))', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
  
  
end