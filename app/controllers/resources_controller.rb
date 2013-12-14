class ResourcesController < ApplicationController
  def create
    resource = Resource.create params[:resource]
    redirect_to list_topic_path(resource.topic.list.id, resource.topic.id)
  end
end
