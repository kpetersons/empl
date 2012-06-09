# == Schema Information
#
# Table name: playlist_media
#
#  id          :integer(4)      not null, primary key
#  playlist_id :integer(4)
#  medium_id   :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class PlaylistMedium < ActiveRecord::Base

  belongs_to :playlist
  belongs_to :medium_rel, :class_name => 'Medium'

  attr_accessible :playlist_id, :medium_id

  validates :playlist_id, :presence => true
  validates :medium_id, :presence => true
  validates :medium_id, :uniqueness => {:scope => :playlist_id}


  def as_json(options)
    options = {:methods => [:medium], :only => [:id, :medium_id, :playlist_id]}.merge(options)
    super(options)
  end

  def medium
    return medium_rel.id unless medium_rel.nil?
  end

end
