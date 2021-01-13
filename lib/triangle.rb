class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    valid_triangles = [(a + b > c), (c + b > a), (a + c > b)]
    [a, b, c].each do |side|
      valid_triangles << false if side <= 0
      raise TriangleError if valid_triangles.include?(false)
    end
  end

  class TriangleError < StandardError
  end
end
