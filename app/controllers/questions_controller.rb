class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @choices = [@question.choice_a, @question.choice_b, @question.choice_c, @question.choice_d]
    @counts = [@question.count_a, @question.count_b, @question.count_c, @question.count_d]
    @total = @counts.inject(0, :+)
    @heights = []
    @counts.each do |count|
      if @total == 0
        @heights.push(0)
      else
        @heights.push((Float(count)/@total)*100)
      end
    end
    render :layout => 'question_layout'
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
    question_count = Question.count
    rand_question = rand(question_count) + 1
    if !(cookies[:visited_questions].nil?) && cookies[:visited_questions].split("-").length < question_count
      visited_questions = cookies[:visited_questions].split("-")

      while visited_questions.include? rand_question.to_s
        rand_question = rand(question_count) + 1
      end

      visited_questions.push(rand_question)

      cookies[:visited_questions] = {
        value: visited_questions.join("-"),
        expires: 1.day.from_now }

    else
      cookies[:visited_questions] = rand_question.to_s
    end
    puts "redirecting to #{rand_question}"
    redirect_to questions_show_path(id: rand_question)
  end
end
