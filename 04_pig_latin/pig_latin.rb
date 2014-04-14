def translate(string)
  # *Known bugs* 
  # In words with two of the same consonant, instead of only the first instance of the consonant being deleted, all instances of the consonant are deleted.
  
  vowels = %w[a e i o u A E I O U]
  consonant_arr = []
  translated_words = []
  element_to_chars_arr = []
  symb_arr = []
  word_arr = string.split(" ")
  
  j = 0

  for j in 0...word_arr.length
    
    will_cap = false
    transfer_punc = false
    
    word_arr[j].each_char {|sym| symb_arr << sym if ("." == sym || "," == sym || "!" == sym || "?" == sym)}
    
    transfer_punc = true if symb_arr != []
    
    # If the first letter of the word at index j is a vowel, the word is simply sent to translated_words with "ay" appended to the end of it
    if vowels.include?(word_arr[j].chars.first)

      translated_words << (word_arr[j] + "ay") if !transfer_punc
      
      # If there is punctuation attached to the current word it is deleted and subsequently appended to the end of the word after "ay"
      translated_words << (word_arr[j].delete(symb_arr.join("")) + "ay" + symb_arr.join("")) if transfer_punc
      
    else
      
      will_cap = true if word_arr[j] == word_arr[j].capitalize
      
      word_arr[j].each_char {|char| element_to_chars_arr << char}
      
      curr_char_pos = 0
     
      # Loop to add consonants that may exist at the beginning of the string to a new array to be chopped off later
      loop do  
        consonant_arr << element_to_chars_arr[curr_char_pos]
        
        # "qu" exception conditional
        consonant_arr << ["u"] if (element_to_chars_arr[curr_char_pos] == "q") && (element_to_chars_arr[curr_char_pos + 1] == "u")
       
        curr_char_pos += 1
        
        # Exits loop if the current character being evaluated is a vowel
        break if vowels.include?(element_to_chars_arr[curr_char_pos])
      end
    
      # Removes first consonant letters from beginning of word 
      mod_word =  element_to_chars_arr.join("").delete(consonant_arr.join("")) if !transfer_punc
      
      mod_word = element_to_chars_arr.join("").delete(consonant_arr.join("")).delete(symb_arr.join("")) if transfer_punc
      
      # Adds consonants + ay to the end of the freshly chopped word 
      if will_cap  
        translated_words << (mod_word + consonant_arr.join("") + "ay" + symb_arr.join("")).capitalize 
      else 
        translated_words << (mod_word + consonant_arr.join("") + "ay" + symb_arr.join(""))
      end
            
      # Reset each holder for words being modified to avoid appending previous consonants onto new words that begin with a consonant
      mod_word = ""
      element_to_chars_arr = []
      consonant_arr = []
      symb_arr = []
    end
    j += 1
  end
  translated_words.join(" ")
end