used_letters = []
5.times do |i|
  letters = []
  4.times do
    letter = ('a'...'z').to_a[rand(('a'...'z').to_a.length)]
    while used_letters.include? letter
      letter = ('a'...'z').to_a[rand(('a'...'z').to_a.length)]
    end
    letters.push(letter)
  end
  Question.create(question: "Which letter is the best out of these four?",
                  choice_a: letters[0],
                  choice_b: letters[1],
                  choice_c: letters[2],
                  choice_d: letters[3])
end

used_numbers = []
5.times do |i|
  numbers = []
  4.times do
    number = rand(100)
    while used_numbers.include? number
      number = ('a'...'z').to_a[rand(('a'...'z').to_a.length)]
    end
    numbers.push(number)
  end
  Question.create(question: "Which number is the best out of these four?",
                  choice_a: numbers[0],
                  choice_b: numbers[1],
                  choice_c: numbers[2],
                  choice_d: numbers[3])
end
