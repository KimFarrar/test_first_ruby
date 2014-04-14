class Timer
  attr_accessor :seconds
  
  def initialize
    @seconds = 0
  end  
    
  def time_string
    timer = []
    sec = @seconds%60
    min = (@seconds/60)%60
    hr = @seconds/3600
    
    timer = "#{padded(hr)}:#{padded(min)}:#{padded(sec)}" 
  end
  
  def padded(t)
   # Allows padding sec/min/hr with 0 + t unless t is a two digit number
   sprintf "%02d", t 
  end
end