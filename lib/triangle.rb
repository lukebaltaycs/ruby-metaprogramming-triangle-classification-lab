class Triangle

  attr_accessor :side_one, :side_two, :side_three
  
  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
    @sides = [@side_one, @side_two, @side_three]

    if (@side_one + @side_two <= @side_three) || (@side_one + @side_three <= @side_two) || (@side_two + @side_three <= @side_one)
      raise TriangleError
    elsif @sides.include?(0)
      raise TriangleError
    end
  end

  def how_many_equal
    equal = 0
    @sides.each do |side|
      @sides.each do |lower_side|
        if side == lower_side
          equal += 1
        end
      end
    end
    equal
  end

  def kind
    if how_many_equal == 9
      return :equilateral
    elsif how_many_equal == 5
      return :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "the side lengths are all jacked up"
    end
  end
end
