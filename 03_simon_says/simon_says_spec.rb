# # Simon Says
#
# ## Topics
#
# * functions
# * strings
# * default parameter values
#
# ## Hints
#
# When you make the second `repeat` test pass, you might break the **first**
#

require "simon_says"

# NOTE: I had to change this file to instantiate the Simon_says class and then append each that variable to each method call within each "it...do" statement to get the spec file to rake properly on my machine.
describe Simon_says do

  describe "echo" do
    simon = Simon_says.new
    it "should echo hello" do
      simon.echo("hello").should == "hello"
    end

    it "should echo bye" do
      simon.echo("bye").should == "bye"
    end
  end

  describe "shout" do
    simon = Simon_says.new
    it "should shout hello" do
      simon.shout("hello").should == "HELLO"
    end

    it "should shout multiple words" do
      simon.shout("hello world").should == "HELLO WORLD"
    end
  end

  describe "repeat" do
    simon = Simon_says.new
    it "should repeat" do
      simon.repeat("hello").should == "hello hello"
    end

    # Wait a second! How can you make the "repeat" method
    # take one *or* two arguments?
    #
    # Hint: *default values*
    it "should repeat a number of times" do
      simon.repeat("hello", 3).should == "hello hello hello"
    end
  end

  describe "start_of_word" do
    simon = Simon_says.new
    it "returns the first letter" do
      simon.start_of_word("hello", 1).should == "h"
    end

    it "returns the first two letters" do
      simon.start_of_word("Bob", 2).should == "Bo"
    end

    it "returns the first several letters" do
      s = "abcdefg"
      simon.start_of_word(s, 1).should == "a"
      simon.start_of_word(s, 2).should == "ab"
      simon.start_of_word(s, 3).should == "abc"
    end
  end

  describe "first_word" do
    simon = Simon_says.new
    it "tells us the first word of 'Hello World' is 'Hello'" do
      simon.first_word("Hello World").should == "Hello"
    end

    it "tells us the first word of 'oh dear' is 'oh'" do
      simon.first_word("oh dear").should == "oh"
    end
  end

  describe "titleize" do
    simon = Simon_says.new
    it "capitalizes a word" do
      simon.titleize("jaws").should == "Jaws"
    end

    it "capitalizes every word (aka title case)" do
      simon.titleize("david copperfield").should == "David Copperfield"
    end

    it "doesn't capitalize 'little words' in a title" do
      simon.titleize("war and peace").should == "War and Peace"
    end

    it "does capitalize 'little words' at the start of a title" do
      simon.titleize("the bridge over the river kwai").should == "The Bridge over the River Kwai"
    end
  end

end
