class Thing < ActiveRecord::Base
  has_many :notes
  belongs_to :type
end
