class Test
  attr_reader :points

  def initialize(list_questions, list_answers)
    @points = 0
    @current_question = 0

    @questions = []
    @answers = []

    make_questions(list_questions)
    make_answers(list_answers)
  end

  def make_questions(file_name)
    nil unless File.exist?(file_name)

    File.open(file_name, 'r:UTF-8') {|file| @questions = file.readlines}
  end

  def make_answers(file_name)
    nil unless File.exist?(file_name)

    File.open(file_name, 'r:UTF-8') {|file| @answers = file.readlines}
  end

  def finished?
    @current_question >= @questions.size
  end

  def current_question
    @questions[@current_question]
  end

  def check(user_answer)
    if user_answer == 1
      @points += 2
    elsif user_answer == 3
      @points += 1
    end

    @current_question += 1
  end

  def results
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
