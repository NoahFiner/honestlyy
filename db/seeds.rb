def createQuestion(question, a, b, c, d)
  Question.create(question: question,
                  choice_a: a,
                  choice_b: b,
                  choice_c: c,
                  choice_d: d)
end

def questionFromArray(question, array)
  options = []
  used_options = []
  4.times do
    option = array[rand(array.length)]
    while used_options.include? option
      option = array[rand(array.length)]
    end
    options.push(option)
    used_options.push(option)
  end
  createQuestion(question,
                options[0], options[1], options[2], options[3])
end

5.times do |i|
  questionFromArray("Which of these letters is the best?", ('a'...'z').to_a)
end

5.times do |i|
  questionFromArray("Which of these numbers is the best?", (1...100).to_a)
end

3.times do |i|
  questionFromArray("Which of these negative numbers is the best?", (-100...-1).to_a)
end

2.times do |i|
  questionFromArray("Which single-digit number is the best?", (1...9).to_a)
end

createQuestion("Which mathematical operator is the best?", "+", "-", "*", "/")
createQuestion("Which of these punctuation marks is the best?", ".", ",", "!", "?")
createQuestion("Which of these parentheses is the best?", "{}", "()", "[]", "<>")
createQuestion("Which direction is the best?", "North", "South", "East", "West")
