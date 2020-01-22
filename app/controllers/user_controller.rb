class UserController < ApplicationController
  before_action :forget_selected_item, {only: [:index]}
  
  def login_form
  end
  
  def login
    @error_message = params[:uid]
    @user = User.find_by(user_id: params[:uid], password: params[:pwd])
    if @user
      session[:user_id] = @user.id
      if @user.is_admin != nil
        session[:is_admin] = 1
      end 
      redirect_to("/product/all_index")
    else
      #@error_message = "ユーザIDまたはパスワードが間違っています"
      @user_id = params[:uid]
      @password = params[:pwd]
      render("user/login_form")
    end
  end 

  def logout
    session[:user_id] = nil
    if session[:is_admin]
      session[:is_admin] = nil
    end
   # if session[:edit]
    #  session[:edit] = nil
    #end
    redirect_to("/login")
    #render("user/login_form")
  end
  
  def new
    @user = User.new
  end
  
  def create
    if params[:pwd] == params[:pwd2]
      u = User.find_by(id: session[:user_id])
      @user = User.new(admin_name: params[:name], user_id: params[:id], password: params[:pwd], store_id: u.store_id)
      if @user.save
        redirect_to("/user/index")
      else
        render("user/new")
      end
    end
  end

  def index
      @user = User.where(store_id: @current_user.store_id)
  end
  
  def destroy
    @user = User.find_by(id: params[:selected_item])
    @user.destroy
    redirect_to("/user/index")
  end

  def edit
    if session[:selected_item]
      if params[:id]
        @user = User.find_by(id: params[:id])
        session[:selected_item] = @user.id
      else 
        @user = User.find_by(id: session[:selected_item])
      end
      @id = @user.id
    elsif params[:id] != nil
      @user = User.find_by(id: params[:id])
      @id = params[:id]
      session[:selected_item] = @id
    else 
      @user = User.find_by(id: session[:user_id]) #session[_user_id]はログイン時に保存されるやつ
      @id = session[:user_id]
      session[:selected_item] = @id
    end
  end

  def update
    @user = User.find_by(id: params[:selected_item])
    @id = params[:selected_item]
    if params[:pwd] == @user.password
      #@user.admin_name = params[:name]
      #@user.user_id    = params[:id]
      #@user.password   = params[:newpwd]
      #@user.save
       @user.update(admin_name: params[:name], user_id: params[:id])
       if params[:newpwd]
         @user.update(password: params[:newpwd])
       end
     # if session[:edit] == 1
      #  session[:edit] = nil
      #if @current_user.is_admin
       # redirect_to("/user/index")
      #else
       # session[:edit] = nil
        redirect_to("/product/all_index")
      #end
    else 
      render("user/edit")
    end
  end
end
