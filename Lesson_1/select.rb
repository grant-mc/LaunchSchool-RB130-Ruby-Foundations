def select(array)
  arr_selected = []
  counter = 0

  while counter < array.size
    if yield(array[counter]) == true #produces different output without `== true`
      arr_selected << array[counter]
    end
    counter += 1
  end

  arr_selected
end

array = [1, 2, 3, 4, 5]

#p select(array) { |num| num.odd? }      # => [1, 3, 5]
#p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true