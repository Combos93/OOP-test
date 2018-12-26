require_relative 'lib/test'

system 'cls'

file_path_q = "#{__dir__}/data/questions.txt"
file_path_a = "#{__dir__}/data/answers.txt"

puts 'Добрый день! Как Вас зовут?'

my_name = STDIN.gets.chomp

print "\nПриветствуем Вас, #{my_name}, давайте приступим к тесту\n"

test = Test.new

test.make_questions(file_path_q)
test.make_answers(file_path_a)

until test.finished?
  puts test.current_question
  print "\nвведите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter\n"
  user_answer = STDIN.gets.to_i

  test.check(user_answer)
end

system 'cls'

print "#{my_name}, результат теста (всего баллов - #{test.points}):\n"

puts test.print_result