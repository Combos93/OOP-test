class Test
  attr_reader :points

  def initialize
    @current_question = 0
    @points = 0

    @questions = []
    @answers = []

    # current_path = File.dirname(__FILE__)
    file_path_q = "#{__dir__}/../data/questions.txt"
    file_path_a = "#{__dir__}/../data/answers.txt"

    q = File.new(file_path_q, 'r:UTF-8')
    @questions = q.readlines
    q.close

    a = File.new(file_path_a, 'r:UTF-8')
    @answers = a.readlines
    a.close
  end

  def finished?
    @current_question >= @questions.size
  end

  def current_question
    @questions[@current_question]
  end

  def check(user_answer)
    @user_input = user_answer

    if @user_input == 1
      @points += 2
    elsif @user_input == 3
      @points += 1
    end

    @current_question += 1
  end

  def print_result
    case @points
    when 0..3
      @answers[6]
    when 4..8
      @answers[5]
    when 9..13
      @answers[4]
    when 14..18
      @answers[3]
    when 19..24
      @answers[2]
    when 25..29
      @answers[1]
    else
      @answers[0]
    end
  end
end
