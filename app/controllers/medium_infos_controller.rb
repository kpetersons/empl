class MediumInfosController < ApplicationController

  before_filter :authorize
  respond_to :json, :html

  def index
    if params[:ids].nil?
      render :json => [], :status => 200 and return
    end
    render :json => {:medium_infos => MediumInfo.where(:id => params[:ids])}, :status => 200
  end

end
