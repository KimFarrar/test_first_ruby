class Temperature
  def initialize(options = {})
    # Converts to :f or :c value into Kelvin representation to standardize later operations and avoid manipulating options parameter throughout methods 
    @kelvin = options.key?(:f) ? ((options[:f] + 459.67)* 5.0/9) : (options[:c] + 273.15)
  end 
  
  def in_fahrenheit
    ((@kelvin * 9/5) - 459.67).round(2)
  end
  
  def in_celsius
    (@kelvin - 273.15).round(2)
  end
 
  def self.from_fahrenheit(value)
    self.new(:f => value)
  end
  
  def self.from_celsius(value)
    self.new(:c => value)
  end 
end

# Opted for creating new classes that inherit Temperature for increased organization and readability (personal preference)
class Celsius < Temperature 
  def initialize(value) 
    super(:c => value)
  end
end

class Fahrenheit < Temperature
  def initialize(value)
    super(:f => value)
  end
end