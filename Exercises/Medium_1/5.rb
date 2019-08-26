items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *veggies, grain |
  puts veggies.join(', ')
  puts grain
end

gather(items) do | fruit, *veggies, grain |
  puts fruit
  puts veggies.join(', ')
  puts grain
end

gather(items) do | fruit, *others|
  puts fruit
  puts others.join(', ')
end

gather(items) do | apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end