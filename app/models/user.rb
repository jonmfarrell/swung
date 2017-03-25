class User < ActiveRecord::Base
  has_one :gender
  belongs_to :favorite_team, class_name: "Team"
  belongs_to :least_favorite_team, class_name: "Team"
  
  has_many :histories
  has_many :dates, through: :histories
end