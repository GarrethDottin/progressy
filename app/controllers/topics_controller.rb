class TopicsController < ApplicationController
  def create
    Topic.create params[:topic]
    redirect_to list_path(params[:topic][:list_id])
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @resource = Resource.new
  end

end
