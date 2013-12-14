class UserTopicsController < ApplicationController
  def update
    @user_topic = UserTopic.find(params[:id])
    topic_belongs_to_current_user = false
    current_user.user_topics.each do |user_topic|
      topic_belongs_to_current_user = true if user_topic.id == @user_topic.id
    end
    if topic_belongs_to_current_user
      user = current_user
      @user_topic.rating = params[:new_rating].to_i
      @user_topic.save
      history = @user_topic.user.history
      list_being_modified_id = List.find(@user_topic.topic.list_id).id
      list_being_modified = List.find(@user_topic.topic.list_id).name
      column_being_modified = history[0].index(list_being_modified)
      last_entry = history[-1]
      todays_date = Time.new.to_date.to_s
      user_topics_in_list_being_modified = []
      UserTopic.all.each do |user_topic|
        user_topics_in_list_being_modified << user_topic if user_topic.user_id == user.id && user_topic.topic.list_id == list_being_modified_id
      end
      list_ratings = user_topics_in_list_being_modified.inject(0) {|sum, user_topic| sum + user_topic.rating }
      if last_entry[0] == todays_date
        last_entry[column_being_modified] = list_ratings
      else
        new_entry = last_entry.dup
        new_entry[0] = todays_date
        new_entry[column_being_modified] = list_ratings
        history.push(new_entry)
      end
      user.history = history
      user.save
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
