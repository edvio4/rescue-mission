class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.order(created_at: :desc)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answers = Answer.where(question: @question)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit

  end

  # POST /questions
  # POST /questions.json
  def create
  @question = Question.new(question_params)
  flash[:notice] = 'Question was successfully created.' if @question.save
  respond_with(@question)
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    flash[:notice] = 'Question was successfully updated.' if @question.update(question_params)
    respond_with(@question)
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    answers = Answer.where(question: @question)
    answers.each { |answer| answer.destroy }

    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
