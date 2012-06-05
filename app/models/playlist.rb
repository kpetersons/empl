# == Schema Information
#
# Table name: playlists
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Playlist < ActiveRecord::Base
  attr_accessible :name

  has_many :playlist_media_rel, :class_name => 'PlaylistMedium'

  def as_json(options)
    options = {:methods => [:playlist_media], :only => [:name, :id, :user_id]}.merge(options)
    super(options)
  end

  def playlist_media
    ids = []
    playlist_media_rel.each do |mi|
      ids<<mi.id
    end
    return ids
  end

end
