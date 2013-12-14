class ListsController < ApplicationController
  def create
    List.create params[:list]
  end

  def new
    @list = List.new
  end

end

