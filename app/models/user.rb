class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :firstname, :lastname, :username, :email, :password
  attr_reader :admin
  has_many :user_topics
  has_many :resources
  after_create :create_topics


  protected
  def create_topics
    Topic.all.each do |topic|
      UserTopic.create(user_id: self.id, topic_id: topic.id, rating: 0)
    end
  end
end