class UserOuting < ActiveRecord::Base
  has_one :user
  has_one :outing
end