class Outing < ActiveRecord::Base
  belongs_to :history
  has_many :locations
  has_many :users, through: :user_outings
end