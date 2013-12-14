class TopicsController < ApplicationController
  def create
    Topic.create params[:topic]
  end

  def new
    @topic = Topic.new
  end

end
