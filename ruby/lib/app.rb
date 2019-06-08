require_relative "number_pair"

test = [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9]
test_3 = [-13, -5, 23]
SUM = 10

puts NumberPair.find_pairs(test_3, SUM)
