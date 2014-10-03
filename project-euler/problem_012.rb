<<-PROBLEM

The sequence of triangle numbers is generated by adding the natural numbers.
So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.

The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28

We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?

PROBLEM

class Integer
  def factors_1
    (1..self).select { |n| (self % n).zero? }
  end
end

# More optimal solution.
class Integer
  def factors_2
    1.upto(Math.sqrt(self)).select {|i| (self % i).zero?}.inject([]) do |f, i|
      f << i
      f << self/i unless i == self/i
      f
    end.sort
  end
end

require 'prime'

# Using Ruby's built in prime class.
class Integer
  def factors_3
    Prime.prime_division(self).flatten.sort.uniq
  end
end

def triangle_numbers(option)
  (1..Float::INFINITY).inject(0) do |sum, n|
    sum += n
    return n if sum.send("factors_#{option}").count > 500
    sum
  end
end

# puts "Triangle Number Solution with SOLN 1 = #{triangle_numbers(1)}"
# puts "Triangle Number Solution with SOLN 1 = #{triangle_numbers(2)}"
puts "Triangle Number Solution with SOLN 1 = #{triangle_numbers(3)}"
