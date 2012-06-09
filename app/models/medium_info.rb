class MediumInfo < ActiveRecord::Base
  belongs_to :medium
  attr_accessible :attr_key, :attr_value, :medium_id

  validates :attr_key, :presence => true
  validates :attr_value, :presence => true

end
