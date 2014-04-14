class Some_silly_block_functions
  # Splits string arg on white space, reverses each word and places reversed word into array before finally joining array contents 
  def reverser
    yield.split(" ").map(&:reverse).join(" ")
  end
  
  def adder(arg=1)
    yield + arg
  end
  
  # If no args are passed block yields true, otherwise it executes block arg.times 
  def repeater(arg=0)
    
    if arg == 0
      yield true
    else
      arg.times do
        yield
      end
    end
  end
end
