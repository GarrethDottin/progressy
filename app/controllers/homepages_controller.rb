class HomepagesController < ApplicationController
  def index
    @user = User.new
    redirect_to '/lists' if current_user
  end
end