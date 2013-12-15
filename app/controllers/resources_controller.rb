class ResourcesController < ApplicationController
  def create
    p "3"*30
    p params
    resource = Resource.create params[:resource]
    if request.xhr?
      render partial: 'topics/topic', locals: {topic: Topic.where(id = resource.topic_id)}, layout: false
    end
    redirect_to topic_path(resource.topic.id)
  end
end
