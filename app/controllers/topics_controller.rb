class TopicsController < ApplicationController
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
    @topic = Topic.find(params[:id])
    @resource = Resource.new
  end

end
