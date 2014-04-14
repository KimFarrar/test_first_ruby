class Dictionary
  def initialize (dict = {})
    @dict = dict
  end
  
  def entries
    @dict
  end
  
  def add(entry)
    # Creates key value pair using entry as the key and assigning its value to nil if entry is a string, else merges entry (which is in this case a hash) with the @dict hash
    entry.is_a?(String) ? @dict[entry]=nil : @dict.merge!(entry)
  end
  
  def keywords
    @dict.keys.sort
  end
  
  def include?(query)
    @dict.keys.include?(query) ? true : false
  end
  
  def find(query)
    matches = {}
    @dict.each do |key, value|
      # Slices key to the same length of query to then evaluate wheter or not they are an exact match
      if key[0...query.length] == query
        matches[key] = value
      # Slices query and key to determine partial match of query to key
      elsif query[0..query.length] == key[0..query.length]
        matches[key] = value
      end
    end
    matches
  end
  
  def printable
    # Maps @dict to p_arr to achieve specified format
    p_arr = @dict.sort.map do |key, value|
      "[#{key}] \"#{value}\""
    end
    p_arr.join("\n")
  end
end