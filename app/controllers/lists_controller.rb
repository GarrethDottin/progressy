class ListsController < ApplicationController
  def create
    List.create params[:list]
  end

  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

end

