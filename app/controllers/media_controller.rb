class MediaController < ApplicationController

  before_filter :authorize
  respond_to :json, :html

  def create
    if params[:medium][:medium].content_type.start_with? 'audio'
      Medium.transaction do
        medium = current_user.media.new(params[:medium])
        medium.save
        render :json => medium, :status => 200
      end

    end
  end

  def index
    media = {:mediums => current_user.media}
    respond_with media
  end

end
