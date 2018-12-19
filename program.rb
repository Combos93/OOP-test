
require_relative "test"

system "cls"

puts "Добрый день! Как Вас зовут?"

my_name = STDIN.gets.chomp

print "\nПриветствуем Вас, #{my_name}, давайте приступим к тесту\n"

test = Test.new

until test.finished?
  puts test.current_question
  print "\nвведите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter\n"
  user_answer = STDIN.gets.to_i

  test.check(user_answer)
end

system "cls"

print "#{my_name}, результат теста (всего баллов - #{test.points}):\n"

puts test.print_result
