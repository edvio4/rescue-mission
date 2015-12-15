class AnswersController < ApplicationController
  respond_to :html, :json


  # GET questions/:id/answers/new
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end


  # POST questions/:id/answers/new
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:answer][:question_id])
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully added.' }
        format.json { render :'/questions/show', status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:description, :question_id)
    end
end
