class TopicsController < ApplicationController
  before_filter :screen_user

  def create
    new_topic = Topic.create params[:topic]
    User.all.each do |user|
      UserTopic.create(user_id: user.id, topic_id: new_topic.id, rating: 0)
    end
    redirect_to list_path(params[:topic][:list_id])
  end

  def new
    if current_user && current_user.is_admin
      @topic = Topic.new
      render 'new'
    else
      redirect_to '/'
    end
  end

  def show
    p "#" * 100
    p params
    @topic = Topic.find(params[:id])
    @resource = Resource.new
    if request.xhr?
      render partial: 'topics/topic', locals: {topic: @topic}, layout: false
    end
  end

  def screen_user
    redirect_to '/' unless current_user && current_user.is_admin
  end

end
