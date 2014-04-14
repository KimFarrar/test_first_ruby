class Array
  def sum
    self == [] ? 0 : self.inject(:+)
  end
  
  # Returns an empty array if square is called on [] else returns a new array populated with the squares of each index of the original array
  def square
    self == [] ? [] : self.map { |i| i ** 2 }
  end
  
  def square!
    self == [] ? [] : self.map! {|i|  i ** 2 }
  end
end
