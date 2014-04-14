def add(x, y)
  total = x.to_f + y.to_f
  total
end

def subtract(x, y)
  total = x - y
  total
end

def sum(arr)
  total = arr.inject(:+)
  # handles case of empty array
  total = 0 if arr == []
  total
end

def multiply(arr)
  product = 1.0
  arr.each {|num| product *= num}  
  # handles case of empty array
  product = 0 if arr == []
  product
end

def power(x, y)
  total = x
  for i in 1...y 
    total *= x
  end  
  total
end

def factorial(num)
  num_arr = []
  i = 1
  for i in 1..num
    num_arr << i
  end
  total = num_arr.inject(:*)
  # handles case of 0 (unusual factorial)
  total = 1 if num == 0
  total
end
