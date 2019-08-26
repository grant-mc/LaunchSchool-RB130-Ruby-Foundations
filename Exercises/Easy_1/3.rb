def missing(sorted_arr)
  complete_arr = (sorted_arr.min..sorted_arr.max).to_a
  complete_arr.select { |num| !sorted_arr.include?(num)}
end



p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []