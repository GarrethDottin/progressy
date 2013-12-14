class ListsController < ApplicationController
  def create
    List.create params[:list]
    redirect_to lists_path
  end

  def new
    if current_user && current_user.is_admin
      @list = List.new
      render 'new'
    else
      redirect_to '/'
    end
  end

  def index
    # @ratings = current_user.user_topics.map { |user_topic| user_topic.rating }
    @user = current_user
    @user_topics = @user.user_topics.order('created_at ASC')

    @user_topics_with_list_ids = {}
    @user_topics.each do |user_topic|
      list_id = user_topic.topic.list_id
      p list_id
      @user_topics_with_list_ids[user_topic] = list_id
    end
    @lists = List.all
    @resource = Resource.new
  end

  def show
    @list = List.find(params[:id])
  end

  def peer_list
    @user = User.find(params[:peer_id])
    @user_topics = @user.user_topics.order('created_at ASC')

    @user_topics_with_list_ids = {}
    @user_topics.each do |user_topic|
      list_id = user_topic.topic.list_id
      p list_id
      @user_topics_with_list_ids[user_topic] = list_id
    end
    @lists = List.all
    @resource = Resource.new
    render partial: 'list_content', locals: {user: @user, user_topics_with_list_ids: @user_topics_with_list_ids, lists: @lists, resource: @resource}, layout: false
  end

end

