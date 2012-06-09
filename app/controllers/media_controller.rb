class MediaController < ApplicationController

  before_filter :authorize
  respond_to :json, :html

  def create
    logger.debug "**********Params start**************"
    logger.debug params
    logger.debug "**********Params end**************"
    Medium.transaction do
      medium = current_user.media.new(params[:medium])
      if medium.save
        render :json => medium, :status => :ok
      else
        render :json => medium, :status => :unprocessable_entity
      end

    end
  end

  def index
    media = {:mediums => current_user.media}
    respond_with media
  end

end
