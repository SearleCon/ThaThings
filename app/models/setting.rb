class Setting < ActiveRecord::Base
  
  belongs_to :user
  
  validates :rowcountperpage, :numericality => { :only_integer => true, :less_than_or_equal_to => 150 }

  HUMANIZED_ATTRIBUTES = {
      :rowcountperpage => "Number of rows"
    }
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end