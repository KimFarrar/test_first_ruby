class Book  
  def title
    @title
  end
  
  def title=(title)
    @title = titleize(title)
  end
    
  def titleize(title)
    stop_words = %w[the a an of in and]
    # Stores the block that evaluates each word and determines whether or not to capitalize it in a proc
    cap_eval = Proc.new {|word| stop_words.include?(word) ? word : word.capitalize}
    title.capitalize.gsub(/\S+/, &cap_eval) 
  end
end