class List < ActiveRecord::Base
  attr_accessible :name
  has_many :topics
  has_many :resources
end
