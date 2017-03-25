class User < ActiveRecord::Base
  has_one :gender
  has_one :favorite_team, class_name: "Team"
  has_one :least_favorite_team, class_name: "Team"
  # has_many :dates
  # has_many :dating_histories

end