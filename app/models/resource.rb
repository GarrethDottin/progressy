class Resource < ActiveRecord::Base
  attr_accessible :content, :topic_id
  validates :content, presence:  true
  belongs_to :topic
  belongs_to :user
end
