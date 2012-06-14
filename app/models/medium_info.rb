class MediumInfo < ActiveRecord::Base

  belongs_to :medium
  belongs_to :attr_key_rel, :class_name => 'AttrKey'

  attr_accessible :attr_key_id, :attr_value, :medium_id

  validates :attr_key_id, :presence => true
  validates :attr_value, :presence => true

  def as_json(options)
    options = { :methods => [:attr_key, :errors]}.merge(options)
    super(options)
  end

  def attr_key
    attr_key_rel.name
  end

end
