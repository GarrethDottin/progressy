class UserTopicsController < ApplicationController
  def update
    p "*" * 50
    p params
    @user_topic = UserTopic.find(params[:id])
    topic_belongs_to_current_user = false
    current_user.user_topics.each do |user_topic|
      topic_belongs_to_current_user = true if user_topic.id == @user_topic.id
    end
    if topic_belongs_to_current_user
      @user_topic.rating = params[:new_rating].to_i
      @user_topic.save
    end
    @user = User.find(params[:peer_id])
    @user_topics = @user.user_topics.order('created_at ASC')

    @user_topics_with_list_ids = {}
    @user_topics.each do |user_topic|
      list_id = user_topic.topic.list_id
      p list_id
      @user_topics_with_list_ids[user_topic] = list_id
    end
    @lists = List.all
    @resource = Resource.new
    render partial: 'lists/list_content', locals: {user: @user, user_topics_with_list_ids: @user_topics_with_list_ids, lists: @lists, resource: @resource}, layout: false
  end
end
