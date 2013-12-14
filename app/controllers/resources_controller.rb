class ResourcesController < ApplicationController
  def create
    resource = Resource.create params[:resource]
    redirect_to topic_path(resource.topic.id)
  end
end
