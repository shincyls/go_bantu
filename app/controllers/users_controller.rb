class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:index,:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except:[:index, :show, :new, :create]

  include ProjectsHelper
  require 'will_paginate/array'
  
  # When registering for new user
  def new
    @user = User.new
  end

  # GET /users
  # Get profile
  def index
    set_user
    if user_signed_in? 
      render :index
    else
      redirect_to new_user_session_path, info: 'Sign in to view your profile.'
    end
  end
  
  
  
  # GET /users/:id
  def show
    set_user
    # from ProjectsHelper for automatching projects
    matched_projects(@user.id)

    # set percent match for user
    if @hundred
      @projects = @matched_projects
      @match_percent = "100%"
    elsif @seventy_five
      @match_percent = "75%"
    elsif @fifty
      @match_percent = "50%"
    elsif @twenty_five
      @match_percent = "25%"
    else 
      # for empty array to pass message on user show
      @projects = @matched_projects
    end

  end

  # GET /users/:id/edit
  def edit
  end

  # POST /users
  def create
    @project = Project.new(user_params)
    if @project.save
      session[:user_id] = @user.id
      redirect_to @user, flash: { success: 'User was successfully created.' }
    else
      #respond_to :html, :js
      redirect_to root_url, flash: { danger: @user.errors.full_messages[0] }
    end
  end

  # PATCH/PUT /users/:id
  def update
    respond_to :html, :js
    if @user.update(user_params)
      redirect_to @user, flash: { success: 'User was successfully updated.' }
    else
      redirect_to root_url, flash: { danger: 'Failed to Edit user.' }
    end
  end

  # DELETE /users/:id
  def destroy
    session[:user_id] = nil
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, flash: { danger: 'User was successfully destroyed.' } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
 

    # before_action, only owner can :edit :update :destroy their profile
    def authenticate_user!
      if current_user.id != @user.id
        redirect_back(fallback_location: root_path)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :birthday, :password, :avatar)
    end
    
end
