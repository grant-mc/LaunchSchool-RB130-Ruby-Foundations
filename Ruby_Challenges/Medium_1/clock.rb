class Clock
  attr_accessor :hour, :min, :total

  MINUTES_IN_HOUR = 60

  def initialize(hour = 0, min = 0)
    @hour = hour.to_i
    @min = min.to_i
    @total = 0   
  end

  class << Clock
    alias_method :at, :new
  end

  def to_s
    return format('%02d:%02d', hour, min)
  end

  def + (other_min)
    self.total = calc_total + other_min
    normalize(self.total)
  end

  def - (other_min)
    self.total = calc_total - other_min
    self.total = 24 * 60 + self.total if self.total < 0
    normalize(self.total)
  end

  def == (other_clock)
    self.calc_total == other_clock.calc_total
  end

  def normalize(time)
    self.hour = self.total / 60
    self.hour -= 24 if self.hour >= 24
    self.min = self.total % 60
    Clock.new(self.hour, self.min)
  end

  def calc_total
    return self.hour *  MINUTES_IN_HOUR + self.min
  end
end
