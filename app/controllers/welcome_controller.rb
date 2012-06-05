class WelcomeController < ApplicationController

  before_filter :authorize

  def home
    #Playlist.delete (Playlist.where(:name => nil).all)
  end
end
