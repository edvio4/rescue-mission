class AddBestAnswerToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :best_answer, :boolean, null: true
  end
end
