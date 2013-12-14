class Topic < ActiveRecord::Base
  attr_accessible :name, :list_id
  belongs_to :list
  has_many :user_topics
  has_many :resources
end
