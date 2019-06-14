require 'pry'

class NumberPair
  def self.find_pairs(arr, sum)
    if !arr.is_a?(Array)
      return []
    end

    sanitized_arr = arr.select do |elem|
      elem.is_a?(Integer)
    end

    if sanitized_arr.length < 2
      return []
    end

    pairs = []
    sorted_arr = sanitized_arr.sort
    high_index = (sorted_arr.length) -1

    i = 0
    j = high_index

    while sorted_arr[i] <= sum/2 && i < sorted_arr.length - 1
      j = high_index

      while sorted_arr[i] + sorted_arr[j] >= sum && i < j
        if sorted_arr[i] + sorted_arr[j] > sum
          high_index -= 1
        elsif sorted_arr[i] + sorted_arr[j] == sum
          pairs << [sorted_arr[i], sorted_arr[j]]
        end
        j -= 1
      end

      i+= 1
    end

    return pairs
  end

  def self.find_unique_pairs(arr, sum)
    if !arr.is_a?(Array)
      return []
    end

    sanitized_arr = arr.select do |elem|
      elem.is_a?(Integer)
    end

    if sanitized_arr.length < 2
      return []
    end

    pairs = {}
    sorted_arr = sanitized_arr.sort
    high_index = (sorted_arr.length) -1

    i = 0
    j = high_index

    while sorted_arr[i] <= sum/2 && i < sorted_arr.length - 1
      j = high_index

      while sorted_arr[i] + sorted_arr[j] >= sum && i < j
        if sorted_arr[i] + sorted_arr[j] > sum
          high_index -= 1
        elsif sorted_arr[i] + sorted_arr[j] == sum
          pairs[[sorted_arr[i], sorted_arr[j]]] = nil
        end
        j -= 1
      end

      i+= 1
    end

    return pairs.keys
  end

  def self.case_1(arr, sum)
    case_1_array = []

    pairs = self.find_pairs(arr, sum)

    case_1_array += pairs
    reverse_pairs = pairs.reverse

    reverse_pairs.each do |pair|
      case_1_array << pair.reverse
    end
    case_1_array
  end

  def self.case_2(arr, sum)
    case_2_array = []

    unique_pairs_array = self.find_unique_pairs(arr, sum)
      if unique_pairs_array.length > 0
      case_2_array += unique_pairs_array

      if unique_pairs_array[-1][0] == unique_pairs_array[-1][1]
        unique_pairs_array.pop
      end

      unique_pairs_array.reverse.each do |pair|
        case_2_array << pair.reverse
      end
    end

    case_2_array
  end

  def self.case_3(arr, sum)
    self.find_unique_pairs(arr, sum)
  end

end
