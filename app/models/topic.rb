class Topic < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :list
  has_many :user_topics
end
