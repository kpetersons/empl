class PlaylistsController < ApplicationController

  before_filter :authorize
  respond_to :json, :html

  def create
    playlist = current_user.playlists.new(params[:playlist])
    if playlist.save
      render :json =>  {:playlist => playlist}, :status => :ok
    else
      render :json =>  playlist, :status => :unprocessable_entity
    end

  end

  def index
    playlists = {:playlists => current_user.playlists}
    respond_with playlists
  end

end
