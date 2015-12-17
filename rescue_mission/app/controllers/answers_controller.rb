class AnswersController < ApplicationController
  respond_to :html, :json

  # POST questions/:id/answers/new
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    flash[:notice] = 'Question was successfully added.' if @answer.save
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully added.' }
        format.json { render :'/questions/show', status: :created, location: @question }
      else
        @answers = Answer.where(question: @question).order(best_answer: :asc)
        format.html { render :'/questions/show' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
    flash[:notice] = 'You have successfully chosen the best answer.' if @answer.update(answer_params)
    respond_with(@question)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:description, :best_answer)
    end
end
