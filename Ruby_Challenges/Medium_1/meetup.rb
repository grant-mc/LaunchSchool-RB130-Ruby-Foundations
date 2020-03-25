require 'date'

class Meetup
  attr_reader :month, :year, :last_dayof_month

  FIRST_DAY = {
    :first => 1,
    :second => 8,
    :third => 15,
    :fourth => 22,
    :last => -7,
    :teenth => 13
  }

  DAYS_OF_WEEK = {
    :monday => 1,
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4,
    :friday => 5,
    :saturday => 6,
    :sunday => 7
  }

  def initialize (month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    meetup = Date.new(year, month, FIRST_DAY[schedule])
    while meetup.cwday != DAYS_OF_WEEK[weekday]
      meetup += 1
    end
    meetup
  end

end

 Meetup.new(5, 2013).day(:monday, :teenth)
