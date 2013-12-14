class UserTopic < ActiveRecord::Base
  attr_accessible :rating, :user_id, :topic_id
  belongs_to :user
  belongs_to :topic
end
