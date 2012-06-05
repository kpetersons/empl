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

require 'test_helper'

class PlaylistMediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
