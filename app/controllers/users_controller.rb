class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:new, :create]

  #only owners of a user account may edit or delete their accounts
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :check_access, only: [:show]


  # GET /users
  # GET /users.json
  def index
    #users = user_type.all
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if params[:type] == 'Student'
      render :action => 'show_student'
    elsif params[:type] == 'Supervisor'
      render :action => 'show_supervisor'
    end
  end

  def show_student
  end

  def show_supervisor
  end

  # GET /users/new
  def new
    @user = user_type.new
    logger.info user_type.new
    return @user
    #@user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if @user.type == 'Student'
      render :action => 'edit_student'
    elsif @user.type == 'Supervisor'
      render :action => 'edit_supervisor'
    end
  end


  def edit_student
  end

  def edit_supervisor
  end

  # POST /users
  # POST /users.json
  def create
    @user = user_type.new(user_params)
    # check the email address at MIT people directory
    # code sampled from team string quartet
    @email = @user.email.split('@')[0]
    @domain = @user.email.split('@')[1]
    @info = RestClient.get 'http://web.mit.edu/bin/cgicso?',
    {:params=>{:options=>"general",:query=>@email, :output=>"json"}}
    response = @email + "@MIT.EDU"
    respond_to do |format|
      if @info.include? response
        if @user.save
          # Sends a welcome email if the user account is successfully created
          #UserMailer.welcome_email(@user).deliver
          session[:user_id] = @user.id
          format.html { redirect_to postings_path, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'new', status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(user_type_string).permit(:first_name, :last_name, :email, :year, :major, :resume, :resume_file_name, :resume_content_type, :resume_file_size, :resume_updated_at, :lab, :title,:department, :office, :type, :password, :password_confirmation)
    end

    def user_type
      params[:type].constantize
    end

    def user_type_string
      params[:type].downcase
    end
    helper_method :user_type_string

    def check_owner
      unless @user.id == current_user.id
        if current_user.type == 'Student'
          redirect_to student_path(current_user.id), :notice => "You can't access this page"
        elsif current_user.type == 'Supervisor'
          redirect_to supervisor_path(current_user.id), :notice => "You can't access this page"
        end
      end
    end

    def check_access
      if current_user.type == 'Student'
        # Only allow students to see all supervisor profiles, and their own profiles
        unless @user.type == 'Supervisor' or @user.id == current_user.id
          #Redirect to user's own profile
          redirect_to student_path(current_user.id), :notice => "You can only access your own profile"
        end
      end
    end
end

