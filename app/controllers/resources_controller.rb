class ResourcesController < ApplicationController
  def create
    Resource.create params[:resource]
  end
end
