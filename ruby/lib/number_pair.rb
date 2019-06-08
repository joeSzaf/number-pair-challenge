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

      while sorted_arr[i] + sorted_arr[j] >= 10 && i < j
        if sorted_arr[i] + sorted_arr[j] > 10
          high_index -= 1
        elsif sorted_arr[i] + sorted_arr[j] == 10
          pairs << [sorted_arr[i], sorted_arr[j]]
        end
        j -= 1
      end

      i+= 1
    end

    # i = 0
    # sorted_arr.each do |num|
    #   if num > (sum / 2)
    #     break
    #   end
    #
    #   j = high_index
    #   while j > i
    #     current_sum = sorted_arr[i] + sorted_arr[j]
    #
    #     if current_sum == sum
    #       pairs << [sorted_arr[i], sorted_arr[j]]
    #     elsif current_sum < sum
    #       break
    #     end
    #     j -= 1
    #   end
    #   i += 1
    # end

    return pairs
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
    sorted_arr.each do |num|
      if num > sum /2
        break
      end

      j = high_index
      while j > i
        current_sum = sorted_arr[i] + sorted_arr[j]

        if current_sum == sum
          pairs[[sorted_arr[i], sorted_arr[j]]] = nil
        elsif current_sum < sum
          break
        end

        j -= 1
      end

      i += 1
    end

    return pairs.keys

  end
end
