class QuestionsController < ApplicationController
  before_action :admin_check, only: [:approve, :all, :delete]

  def new
    @question = Question.new
  end

  def approve
    @question = Question.find(params[:id])
    @question.approved = true
    @question.save
    flash[:success] = "Question approved."
    redirect_to '/questions/all'
  end

  def create
    @question = Question.new(question_params)
    @question.approved = false
    if @question.save
      flash[:success] = "Question created! It should be approved in a little bit."
      redirect_to '/'
    else
      flash[:danger] = "Question wasn't created. Try fixing the errors."
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @choices = [@question.choice_a, @question.choice_b, @question.choice_c, @question.choice_d]
    @counts = [@question.count_a, @question.count_b, @question.count_c, @question.count_d]
    render :layout => 'question_layout'
  end

  def all
    @questions = Question.all.order(created_at: :desc)
  end

  def delete
    @question = Question.find(params[:id]).destroy
    flash[:success] = "Question deleted."
    redirect_to '/questions/all'
  end

  def edit
    @question = Question.find(params[:id])
    case params[:choice]
    when 'a'
      @question.count_a += 1
    when 'b'
      @question.count_b += 1
    when 'c'
      @question.count_c += 1
    when 'd'
      @question.count_d += 1
    end
    @question.save

    puts "count of question #{params[:id]}"
    puts [@question.count_a, @question.count_b, @question.count_c, @question.count_d]
    redirect_to random_path
  end

  def random
    # cookies.delete :visited_questions
    avail_questions = Question.where(approved: true).pluck(:id)

    rand_question = avail_questions[rand(avail_questions.length)]
    if !(cookies[:visited_questions].nil?) && cookies[:visited_questions].split("-").length < avail_questions.length
      visited_questions = cookies[:visited_questions].split("-")

      while visited_questions.include? rand_question.to_s
        rand_question = avail_questions[rand(avail_questions.length)]
      end

      visited_questions.push(rand_question)

      cookies[:visited_questions] = {
        value: visited_questions.join("-"),
        expires: 1.day.from_now }

    else
      cookies[:visited_questions] = rand_question.to_s
    end
    puts "redirecting to #{rand_question}"
    redirect_to "/questions/#{rand_question}"
  end

  private

    def question_params
      params.require(:question).permit(:question, :choice_a, :choice_b, :choice_c, :choice_d)
    end

    def admin_check
      puts "test"
      puts logged_in
      unless logged_in
        flash[:danger] = "You'll need to log in to access this page."
        redirect_to login_url
      end
    end
end
