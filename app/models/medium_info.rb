class MediumInfo < ActiveRecord::Base
  belongs_to :medium
  attr_accessible :attr_key, :attr_value, :medium_id
end
