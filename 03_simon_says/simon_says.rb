class Simon_says
  
  # duplicates user input
  def echo(phrase)
    phrase
  end
  
  # upcases user input
  def shout(phrase)
    phrase.upcase!
  end
  
  def repeat(phrase, default=2)
    new_str = ""
    default.times { new_str += (phrase + " ") }
    new_str.strip
  end
  
  def start_of_word(word, char)
    word_arr = word.split("")
    # returns element at char - 1 (presumably more user friendly to not need to account for zeroith index) as per spec example
    word_arr[0..char-1].join("")
  end
  
  def first_word(str)
    str_arr = str.split(/\s+/)
    str_arr[0]
  end
  
  def titleize(str)
    str.capitalize!
    # Could add more words to skip_words to increase accuracy in different applications
    skip_words =  %w[and the over]
    final = str.split(" ").map {|word| skip_words.include?(word) ? word : word.capitalize }
    final.join(" ")
  end

end