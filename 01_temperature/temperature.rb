def ftoc(temp)
  cel = (temp.to_f - 32) * 5/9
  cel
end

def ctof(temp)
  far = (temp.to_f * 9/5) + 32
  far
end