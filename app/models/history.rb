class History < ActiveRecord::Base
  has_many :users
  has_many :outings

end