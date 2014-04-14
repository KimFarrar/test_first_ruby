class RPNCalculator 
  def initialize
    @calc_arr = []
  end

  def push(num)
    @calc_arr << num
  end
  
  def plus
    @calc_arr.size >= 2 ? @calc_arr << (sum = @calc_arr.pop + @calc_arr.pop) : (raise "calculator is empty")
  end
  
  def minus
    if @calc_arr.size >= 2 
      first_num = @calc_arr.pop
      sec_num = @calc_arr.pop
      difference = sec_num - first_num
      
      @calc_arr << difference
    else 
      raise "calculator is empty"
    end
  end
  
  def divide
    if @calc_arr.size >= 2
      first_num = @calc_arr.pop.to_f
      sec_num = @calc_arr.pop.to_f
      quotient = sec_num / first_num
      
      @calc_arr << quotient
    else 
      raise "calculator is empty"
    end
  end
  
  def times
    @calc_arr.size >= 2 ? @calc_arr << (prod = @calc_arr.pop.to_f * @calc_arr.pop.to_f) : (raise "calculator is empty")
  end
  
  def tokens(str)
    str_arr = str.split(" ")
    tokenized_str = []
    str_arr.each {|i| i =~ /\W/ ? tokenized_str << i.to_sym : tokenized_str << i.to_i }
    tokenized_str
  end
  
  def evaluate(str)
    # Iterates through str using #tokens and either pushes i to self (stores i in @calc_arr) or performs appropriate operation if i matches operator symbols (:+, :- etc)
    tokens(str).each do |i|
      if i == :+
        self.plus
      elsif i == :-
        self.minus
      elsif i == :*
        self.times
      elsif i == :/
        self.divide
      else
        self.push(i)
      end
    end
    self.value
  end
   
  def value
    @calc_arr.last
  end 
end

