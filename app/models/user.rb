require 'set'
class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :firstname, :lastname, :username, :email, :password
  attr_reader :admin
  has_many :user_topics
  has_many :resources
  serialize :history
  after_create :create_topics
  after_create :create_history




  # protected
  def create_topics
    Topic.all.each do |topic|
      UserTopic.create(user_id: self.id, topic_id: topic.id, rating: 0)
    end
  end

  def create_history
    user_topics = self.user_topics.order('created_at ASC')

    user_history = [['Date']]

    list_ids = Set.new

    user_topics.each do |user_topic|
      list_ids.add(user_topic.topic.list_id)
    end

    list_ids.each do |list_id|
      this_list = List.find(list_id)
      user_history[0] << this_list.name
    end

    row_length = user_history[0].length
    next_row = Array.new(row_length, 0)
    next_row[0] = Time.new.to_date.to_s
    user_history.push(next_row)

    self.history = user_history
    self.save
  end

end