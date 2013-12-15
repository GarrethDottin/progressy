class ResourcesController < ApplicationController
  def create
    @user = User.find(params[:peer_id].to_i)
    if @user.id == current_user.id
      @resource = Resource.create params[:resource]
      @resource.user_id = current_user.id
      @resource.save
      if request.xhr?
        @topic = Topic.find(@resource.topic_id)
        render partial: 'topics/topic', locals: {topic: @topic, resource: @resource, user: @user}, layout: false
      else
        redirect_to topic_path(@resource.topic.id)
      end
    end
  end
end
