class PlaylistMediaController < ApplicationController

  before_filter :authorize
  respond_to :json, :html

  def create
    playlist_medium = PlaylistMedium.new(:playlist_id => playlist.id, :medium_id => params[:playlist_medium][:medium_id])
    playlist_medium.save
    render :json =>  {:playlist_medium => playlist_medium}
  end

  def index
    playlist_media = {:playlist_mediums => PlaylistMedium.where(:id => params[:ids])}
    respond_with playlist_media
  end

  def playlist
    current_user.playlists.where(:id => params[:playlist_medium][:playlist_id]).first
  end

end
