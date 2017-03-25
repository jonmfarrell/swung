class Date < ActiveRecord::Base
  has_many :users
  belongs_to :history
  has_many :locations

end