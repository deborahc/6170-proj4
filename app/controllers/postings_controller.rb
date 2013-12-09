class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]


  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :can_create, only: [:new, :create]
  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all.search(params[:search], params[:category])
    @review = Review.new
    @urop_application = UropApplication.new
  end

  # GET /postings/1
  # GET /postings/1.json
  def show
    @posting = Posting.find(params[:id])
  end

  def show_application
    @posting = Posting.find(params[:posting_id])
    @applications = @posting.urop_applications
    @email = Email.new
  end

  # GET /postings/new
  def new
    @posting = Posting.new
  end

  # GET /postings/1/edit
  def edit
  end

  # POST /postings
  # POST /postings.json
  def create
    @posting = Posting.new(posting_params)

    respond_to do |format|
      if @posting.save
        format.html { redirect_to postings_path, notice: 'Posting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @posting }
      else
        format.html { render action: 'new' }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postings/1
  # PATCH/PUT /postings/1.json
  def update
    respond_to do |format|
      if @posting.update(posting_params)
        format.html { redirect_to @posting, notice: 'Posting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting.destroy
    respond_to do |format|
      format.html { redirect_to postings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting
      @posting = Posting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posting_params
      params.require(:posting).permit(:title, :description, :skills, :funding_type, :supervisor_id)
    end

    # Only supervisors can view, update or delete postings they own
    def check_owner
      unless @posting.supervisor_id == current_user.id
          redirect_to postings_path, :notice => "You can't access this page"
      end
    end

    # Only supervisors can create postings
    def can_create
      unless current_user.type == 'Supervisor'
        redirect_to postings_path, :notice => "You can't make UROP postings"
      end
    end
end
