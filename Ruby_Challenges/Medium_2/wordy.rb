class WordProblem

  OPERATORS = %w(plus minus multiplied divided)
  

  def initialize(question)
    @question = question
  end

  def answer
    answer = calculate_equation(create_equation)
  end

  private_methods

  def create_equation
    equation =[]

    question = @question
    question.gsub!('by ','')
    question.gsub!('?','')
    
    question.split(' ').each do |word|
      equation << word.to_i if word.to_i != 0 unless word == 0
      equation << word if OPERATORS.include?(word)
    end
    
    raise ArgumentError if equation.size <= 1
    equation

  end

  def calculate_equation(equation)
    total = equation[0]
    counter = 1
    while counter < equation.size
      case equation[counter]
        when "plus" then total += equation[counter + 1]
        when "minus" then total -= equation[counter + 1]
        when "multiplied" then total *= equation[counter + 1]
        else
          total = total / equation[counter + 1]  
      end
      counter += 2
    end
    total

  end

end

WordProblem.new('What is 1 plus 1?').answer