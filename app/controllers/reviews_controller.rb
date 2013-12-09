class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    if current_user.type == "Student"
      @reviews = Review.all.search(params[:search]).order("supervisor_id")
    else
      @reviews = current_user.reviews
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.json { render action: 'show', status: :created, location: @review }
        format.html { redirect_to postings_path, notice: 'Review was successfully created.' }
        if current_user.type == "Student"
          format.html { redirect_to postings_path, notice: 'Review was successfully created.' }
        else
          format.html { redirect_to supervisor_application_index_path, notice: 'Review was successfully created.' }
        end
      else
        format.html { redirect_to postings_path, notice: "Review could not be saved. Make sure you fill out fields with an *." }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:overall_rating, :supervisor_rating, :time_commitment, :expected, :work_description, :anonymous, :reflection, :supervisor_id, :student_id)    
    end
end
