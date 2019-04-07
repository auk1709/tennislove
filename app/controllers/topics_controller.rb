class TopicsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create] 
  def index
    @topics = Topic.all.page(params[:page])
  end
  
  def show
    @topic = Topic.find(params[:id])
    if logged_in?
      @topic_content = current_user.topic_contents.build
      3.times do
        @topic_content.images.build
      end
    end
    @topic_contents = @topic.topic_contents
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = '@topic.titleを作成しました。'
      redirect_to @topic
    else
      flash.now[:danger] = '新規作成に失敗しました。'
      render 'topics/new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title, :content, :topic_category_id)
  end
end
