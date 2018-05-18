class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index, :show ]
  # GET /posts
  # GET /posts.json
  def index
    @user = current_user
    @userquest = Userquest.where(user_id: @user.id, success: [1, 2]).last
    
    if @userquest.nil?
      redirect_to makeQuest_path
    end
    
      ##필터링, 검색##
      if params[:status] == '전체'
        @posts = Post.all.order(created_at: :desc).page(params[:page])
      elsif params[:status] == '진행중'
        @posts = Post.where(status: "2").order(created_at: :desc).page(params[:page])
      elsif params[:status] == '완료'
        @posts = Post.where(status: "1").order(created_at: :desc).page(params[:page])
      elsif params[:search_option] == 'title'
        @posts = Post.where('title LIKE?', '%' + params[:text] + '%').all.order(created_at: :desc).page(params[:page])
      else
        user_nickname = Post.all.map(&:user)
        user_nickname.each do |un|
        un_arr = []
        if un.nickname.include?(params[:text])
          un_arr.push(un.id)
        end
        @posts = Post.where(user_id: un_arr).order(created_at: :desc).page(params[:page])
        
        end
          
      end
    ##필터링##
    
    ##검색##
    # if params[:search_option] == 'title'
    #   @posts = Post.where('title LIKE?', '%그래%')
    # else
    #   @posts = Post.where('user LIKE? #{params[:text]}')
    # end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @user = current_user
    @userquest = Userquest.where(user_id: @user.id, success: [1, 2]).last
  end

  # GET /posts/1/edit
  def edit
    authorize_action_for @post
    @user = current_user
    @userquest = Userquest.where(user_id: @user.id, success: [1, 2]).last
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.theme = params[:theme]
    @post.quest_id = params[:quest_id]
    @post.status = params[:status]
    

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize_action_for @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize_action_for @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
