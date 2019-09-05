class Series
  def initialize(string)
    @num = string
    @results = []
  end

  def slices(len)
    raise ArgumentError.new if len > @num.length
    result = []
    arr = @num.split('').map(&:to_i)
    arr.each_with_index do |dig, idx|
        @results << arr.slice(idx..(idx + len - 1)) if (idx + len) <= arr.size
    end
    @results
  end
end

s = Series.new("01234")
s.slices(1)