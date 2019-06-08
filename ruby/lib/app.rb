require_relative "number_pair"

input = [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9]
SUM = 10

case_1_answer = NumberPair.case_1(input, SUM)
case_2_answer = NumberPair.case_2(input, SUM)
case_3_answer = NumberPair.case_3(input, SUM)

puts "Input array: #{input}"
puts
puts "Case 1 Answer:"
puts "#{case_1_answer}"
puts
puts "Case 2 Answer:"
puts "#{case_2_answer}"
puts
puts "Case 3 Answer:"
puts "#{case_3_answer}"
