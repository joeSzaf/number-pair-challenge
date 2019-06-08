require_relative "number_pair"

test = [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9]
test_3 = [-5, 0, 310, 15, 4, 4, 4, 10, -13, -2, -5, 0, 23, -300]
SUM = 10

test_4 = [10, 14, 12, 100, 13, 20]
test_4_expected = []

answer = NumberPair.case_2(test_4, SUM)
binding.pry
