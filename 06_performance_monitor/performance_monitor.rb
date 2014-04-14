class Performance_monitor
  def measure(i=1)
    prev = Time.now
  
    i.times do
      yield
    end
    elapsed_time = (Time.now - prev) / i
  end
end