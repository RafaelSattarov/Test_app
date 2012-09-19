# coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @title = "Все пользователи"
    @users = User.paginate(:page => params[:page])

  end
 
  def show
    @user = User.find(params[:id])
    @events = @user.events.paginate(:page => params[:page])
    @title = @user.name
    respond_to do |format|
      format.html 
      format.json { render json: @events }
    end
  end
  
  def new
    @user = User.new
    @title = "Регистрация"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Добро пожаловать! Теперь вы можете войти указав свой Email и пароль."
      redirect_to sessions_new_path
    else
      @title = "Регистрация"
      render 'new'
    end
  end
 
  def edit
     @title = "Настройки"
  end
   
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Профиль сохранен."
      redirect_to @user
    else
      @title = "Настройки"
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален."
    redirect_to users_path
  end

   
  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
 
end