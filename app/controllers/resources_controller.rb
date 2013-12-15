class ResourcesController < ApplicationController
  def create
    resource = Resource.create params[:resource]
    if xhr.request?
      render partial: 'topics/topic', locals: {topic: resource.topic_id}, layout: false
    end
    redirect_to topic_path(resource.topic.id)
  end
end
