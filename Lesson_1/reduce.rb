def reduce(array, strt=0)
  total = strt
  counter = 0
  while counter < array.size
    total = yield(total, array[counter])
    counter += 1
  end

  total
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass