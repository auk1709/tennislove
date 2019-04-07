class TopicCategoriesController < ApplicationController
  def index
    @topics = Topic.where(topic_category_id: topic_category_id)
  end
  
  def show
    @topics = Topic.where(topic_category_id: params[:id])
  end
end
