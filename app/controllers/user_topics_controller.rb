class UserTopicsController < ApplicationController
  def update
    @user_topic = UserTopic.find(params[:id])
    @user_topic.rating = params[:new_rating].to_i
    @user_topic.save
  end
end
