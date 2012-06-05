# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  email              :string(255)
#  encrypted_password :string(128)
#  salt               :string(128)
#  confirmation_token :string(128)
#  remember_token     :string(128)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class User < ActiveRecord::Base
  include Clearance::User

  has_many :media, :class_name => 'Medium'
  has_many :playlists

end
