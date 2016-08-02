class QuestionsController < ApplicationController
  def show
    @id = params[:id];
    @question = Question.find(params[:id]);
    @choices = [@question.choice_a, @question.choice_b, @question.choice_c, @question.choice_d]
    render :layout => 'question_layout'
  end

  def random
    redirect_to questions_show_path(id: rand(Question.count)+1)
  end
end
