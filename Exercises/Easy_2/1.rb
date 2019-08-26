def step(start, stop, step)
  counter = start
  while counter <= stop
    yield(counter)
    counter += step
  end
  counter
end

step(1, 10, 3) { |value| puts "value = #{value}" }