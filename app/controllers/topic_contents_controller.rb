class TopicContentsController < ApplicationController
  
  
  def create
    @topic = Topic.find(params[:topic_id])
    @topic_content = current_user.topic_contents.build(topic_content_params)
    @topic_content.topic = @topic
    if logged_in?
      @topic_content.user_name = current_user.name
    end
    if @topic_content.save
      flash[:success] = '投稿しました'
      # redirect_to @topic
      redirect_to topic_path(@topic)
    else
      @topic_contents = @topic.topic_contents
      flash.now[:danger] = '投稿できませんでした。'
      render "topics/show"
    end
    
  end
  
  private
  
  def topic_content_params
    params.require(:topic_content).permit(:content, :user_name, images_attributes: [:content])
  end
  
  def images_params
    params.require(:image).permit(:content)
  end 
end
