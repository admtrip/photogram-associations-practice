# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#

class Like < ApplicationRecord
  belongs_to :fan, class_name: "User", foreign_key: "fan_id", optional: true
  belongs_to :photo, foreign_key: "photo_id"
end




  # Association accessor methods to define:
  
  ## Direct associations

  # Like#fan: returns a row from the users table associated to this like by the fan_id column

  # Like#photo: returns a row from the photo table associated to this like by the photo_id column
