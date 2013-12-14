class ListsController < ApplicationController
  def create
    List.create params[:list]
  end

  def new
    @list = List.new
  end

  def index
    @lists = List.all
    @resource = Resource.new
  end

  def show
    @list = List.find(params[:id])
  end

end
