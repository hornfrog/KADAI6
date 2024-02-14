class UsersController < ApplicationController
  def index
    @users = User.all
    @users_total = User.all.count
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start_day, :end_day, :all_day, :schedule_memo))
    if @user.save
      flash[:notice] = "予定を新規追加しました"
      redirect_to :users
    else 
      render "new"
    end     
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start_day, :end_day, :all_day, :schedule_memo))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :users
  end
end
