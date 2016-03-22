class UsersController < ApplicationController


  before_filter :sign_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_filter :correct_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = 'register successfully'
      sign_in @user
      redirect_to @user

    else
      flash[:error] = "#{ @user.errors.full_messages }"
      render 'new'

    end
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  def show
    @posts = current_user.posts.paginate(page: params[:page])
    @post = current_user.posts.new()
  end

  def destroy
  end

  private
    def correct_user
      @user = User.find_by_id(params[:id])
      unless !@user.nil? and @user.id == current_user.id
        redirect_to current_user, notice: 'you have no right to view others personal page'
      end
    end

end
