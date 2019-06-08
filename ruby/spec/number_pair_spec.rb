require "pry"
require "rspec"

require_relative "../lib/number_pair"

RSpec.describe NumberPair do
  sum = 10

  describe "#find_pairs" do

    it "returns an empty array if the length of the array is less than 2 or not an array" do
      expect(NumberPair.find_pairs([], sum)).to eq([])
      expect(NumberPair.find_pairs([5], sum)).to eq([])
      expect(NumberPair.find_pairs(5, sum)).to eq([])
      expect(NumberPair.find_pairs("5, 5, 1, 9", sum)).to eq([])
      expect(NumberPair.find_pairs({title: "test", hash_time: 3}, sum)).to eq([])
    end

    it "handles the provided sample test" do
      test_1 = [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9]
      test_1_expected = [[1,9], [1,9], [4,6], [4,6], [5,5], [5,5], [5,5]]

      expect(NumberPair.find_pairs(test_1, sum)).to eq(test_1_expected)
    end

    it "handles positive and positive number pairs" do
      test_1 = [1, 9]
      test_1_expected = [[1,9]]

      test_2 = [5, 5, 10, 0]
      test_2_expected = [[0, 10], [5,5]]

      test_3 = [5, 5, 5]
      test_3_expected = [[5,5], [5,5], [5,5]]

      test_4 = [7, 3, 6, 3, 4]
      test_4_expected = [[3,7], [3,7], [4,6]]

      test_5 = [7, 3, 6, 3, 4, 3]
      test_5_expected = [[3,7], [3,7],[3,7], [4,6]]

      expect(NumberPair.find_pairs(test_1, sum)).to eq(test_1_expected)
      expect(NumberPair.find_pairs(test_2, sum)).to eq(test_2_expected)
      expect(NumberPair.find_pairs(test_3, sum)).to eq(test_3_expected)
      expect(NumberPair.find_pairs(test_4, sum)).to eq(test_4_expected)
      expect(NumberPair.find_pairs(test_5, sum)).to eq(test_5_expected)
    end

    it "handles positive and negative number pairs" do
      test_1 = [-3, 13]
      test_1_expected = [[-3,13]]

      test_2 = [13, -3]
      test_2_expected = [[-3,13]]

      test_3 = [-13, -5, 23]
      test_3_expected = [[-13,23]]

      test_4 = [-4, 14, -4, -14, -100, 100, -90]
      test_4_expected = [[-90,100], [-4,14], [-4,14]]

      expect(NumberPair.find_pairs(test_1, sum)).to eq(test_1_expected)
      expect(NumberPair.find_pairs(test_2, sum)).to eq(test_2_expected)
      expect(NumberPair.find_pairs(test_3, sum)).to eq(test_3_expected)
      expect(NumberPair.find_pairs(test_4, sum)).to eq(test_4_expected)
    end

    it "handles non-sum pairs and does not return them" do
      test_1 = [1, 8]
      test_1_expected = []

      test_2 = [10, 2, -1, 13]
      test_2_expected = []

      test_3 = [2, 5, 15, 8]
      test_3_expected = [[2,8]]

      test_4 = [4, 4, 4, 4, 4, 4, 4]
      test_4_expected = []

      expect(NumberPair.find_pairs(test_1, sum)).to eq(test_1_expected)
      expect(NumberPair.find_pairs(test_2, sum)).to eq(test_2_expected)
      expect(NumberPair.find_pairs(test_3, sum)).to eq(test_3_expected)
      expect(NumberPair.find_pairs(test_4, sum)).to eq(test_4_expected)
    end

    it "handles non integer numbers by sanitizing them" do
      test_1 = ["2", 8]
      test_1_expected = []

      test_2 = [5.0, 5]
      test_2_expected = []

      test_3 = [7, "3", 3]
      test_3_expected = [[3,7]]

      test_4 = [nil, '3', '-2', 5.342]
      test_4_expected = []

      expect(NumberPair.find_pairs(test_1, sum)).to eq(test_1_expected)
      expect(NumberPair.find_pairs(test_2, sum)).to eq(test_2_expected)
      expect(NumberPair.find_pairs(test_3, sum)).to eq(test_3_expected)
      expect(NumberPair.find_pairs(test_4, sum)).to eq(test_4_expected)
    end
  end

  describe "#case_1" do
    it "handles the provided sample test" do
      test_1 = [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9]
      test_1_expected = [[1,9], [1,9], [4,6], [4,6], [5,5], [5,5], [5,5], [5,5], [5,5], [5,5], [6,4], [6,4], [9,1], [9,1]]

      expect(NumberPair.case_1(test_1, sum)).to eq(test_1_expected)
    end
  end

  describe "#case_2" do
    it "handles the provided sample test" do
      test_1 = [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9]
      test_1_expected = [[1,9], [4,6], [5,5], [6,4], [9,1]]

      expect(NumberPair.case_2(test_1, sum)).to eq(test_1_expected)
    end
  end

end
