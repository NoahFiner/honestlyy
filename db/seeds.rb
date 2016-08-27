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

5.times do
  questionFromArray("Which of these letters is the best?", ('a'...'z').to_a)
end

3.times do
  questionFromArray("Which of these capital letters is the best?", ('A'...'Z').to_a)
end

5.times do
  questionFromArray("Which of these numbers is the best?", (1...100).to_a)
end

3.times do
  questionFromArray("Which of these negative numbers is the best?", (-100...-1).to_a)
end

2.times do
  questionFromArray("Which single-digit number is the best?", (1...9).to_a)
end

2.times do
  questionFromArray("Which of these keyboard buttons is the best?", %w(esc tab shift fn ctrl cmd option delete enter shift eject))
end

3.times do
  questionFromArray("Which color is better?", %w(green blue purple magenta pink red orange yellow black brown white grey))
end

5.times do
  questionFromArray("Which food is better?", %w(chocolate pizza ham hotdogs lettuce grapes apples pears peaches nuts eggs fish beef kale dirt mealworms chicken pork bacon waffles pancakes tissues cake sugar cupcakes))
end

2.times do
  questionFromArray("Which drink is better?", %w(water coke tea coffee pepsi sprite lemonade gasoline))
end

2.times do
  questionFromArray("Which article of clothing is better?", %w(shirt pants shoes hat glasses socks gloves coat hoodie))
end

2.times do
  questionFromArray("Which type of furniture is better?", %w(table chairs couches beanbags tvs cabinets sinks sofas))
end

3.times do
  questionFromArray("Which conjunction is better?", %w(and or but nor so for yet after although as before once since so that though till unless until what when whenever wherever whether while))
end

4.times do
  questionFromArray("Which name is better?", %w(Emma Noah	Olivia Liam Sophia Mason Ava Jacob Mia Ethan James Emily Alex Harper))
end

2.times do
  questionFromArray("Which HTML element is better?", %w(<div> <a> <p> <li> <ul> <span> <svg> <iframe> <body> <html> <head> <link> <script>))
end

questionFromArray("Which finger is better?", ["thumb", "index", "middle", "ring", "pinkie"])

createQuestion("Which mathematical operator is the best?", "+", "-", "*", "/")
createQuestion("Which of these punctuation marks is the best?", ".", ",", "!", "?")
createQuestion("Which of these parentheses is the best?", "{}", "()", "[]", "<>")
createQuestion("Which direction is the best?", "North", "South", "East", "West")
createQuestion("Which arrow key is the best?", "up", "down", "right", "left")
createQuestion("Which ASCII emoji is better?", ":)", ":-)", "(:", "(-:")
createQuestion("Which currency is better?", "dollar", "pound", "euro", "peso")
createQuestion("Which article is better?", "a", "an", "the", "???")
