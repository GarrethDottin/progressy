class TopicsController < ApplicationController
  def create
    new_topic = Topic.create params[:topic]
    User.all.each do |user|
      UserTopic.create(user_id: user.id, topic_id: new_topic.id, rating: 0)
    end
    redirect_to lists_path
  end

  def new
    if current_user && current_user.is_admin
      @topic = Topic.new
      render 'new'
    else
      redirect_to '/'
    end
  end

end
