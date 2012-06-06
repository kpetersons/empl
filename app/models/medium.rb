# == Schema Information
#
# Table name: media
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)
#  medium_file_name    :string(255)
#  medium_content_type :string(255)
#  medium_file_size    :integer(4)
#  medium_updated_at   :datetime
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

class Medium < ActiveRecord::Base

  attr_accessible :medium

  has_attached_file :medium
  has_many :medium_infos_rel, :class_name => 'MediumInfo'
  has_many :playlist_mediums

  before_save :extract_metadata

  def as_json(options)
    options = { :methods => [:medium_infos, :medium_file_url]}.merge(options)
    super(options)
  end

  def medium_infos
    ids = []
    medium_infos_rel.each do |mi|
      ids<<mi.id
    end
    ids
  end

  def medium_file_url
    medium.url
  end

private
  def audio?
    medium_content_type =~ %r{^audio/(?:mp3|mpeg|mpeg3|mpg|x-mp3|x-mpeg|x-mpeg3|x-mpegaudio|x-mpg)$}
  end

  def extract_metadata
    return unless audio?
    path = medium.queued_for_write[:original].path
    open_opts = { :encoding => 'utf-8' }
    Mp3Info.open(path, open_opts) do |mp3info|
      medium_infos_rel<<MediumInfo.new({:attr_key => :title,  :attr_value => mp3info.tag.title})
      medium_infos_rel<<MediumInfo.new({:attr_key => :artist,  :attr_value => mp3info.tag.artist})
      medium_infos_rel<<MediumInfo.new({:attr_key => :album,  :attr_value => mp3info.tag.album})
      medium_infos_rel<<MediumInfo.new({:attr_key => :track_number,  :attr_value => mp3info.tag.tracknum})
    end
  end

end
