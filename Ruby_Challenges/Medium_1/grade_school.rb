class School

  def initialize
    @school = {}
  end

  def add(name, grade)
    school[grade] = [] unless school.has_key?(grade)
    school[grade].push(name).sort!
  end

  def grade(grade)
    return school[grade] if school.has_key?(grade)
    return []
  end

  def to_h
    return school.sort.to_h
  end

  private

  attr_accessor :school
end

school = School.new
[
  ['Jennifer', 4], ['Kareem', 6],
  ['Christopher', 4], ['Kyle', 3]
].each do |name, grade|
  school.add(name, grade)
end
p school.to_h