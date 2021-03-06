class Thing < ActiveRecord::Base
  has_many :notes
  belongs_to :type
  belongs_to :user
  
  validates :short_name, :presence => true
  validates :priority, :inclusion => 1..5, :allow_nil => true # SHAUN, by default, make it that they do not have a priority
  
  # SHAUN SEARCH
  def self.search(search)
    a = []
    i = 0
    @typesearch = Type.all :conditions => ["type_name LIKE ?", "%#{search}%"]
    @typesearch.each do |ts|
      a[i]=ts.id
      i=i+1
    end
    
    if search
      find(:all, :conditions => ['short_name LIKE ? or long_name LIKE ? or type_id in (?)', "%#{search}%", "%#{search}%", a])
#      find(:all, :conditions => ['short_name LIKE ? or long_name LIKE ? or type_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
#      find(:all, :conditions => ['(short_name LIKE ? or long_name LIKE ?) or (type_id LIKE (select id from types where id = ?))', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
  
  
end