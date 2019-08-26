def zip (arr1, arr2)
  big_daddy = []
  arr1.each_with_index { |e, i| big_daddy << [e, arr2[i]] }
  big_daddy
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]