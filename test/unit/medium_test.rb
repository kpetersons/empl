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

require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
