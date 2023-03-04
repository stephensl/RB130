# -------------------------------------------------------------------------------
#                                  QUESTION: 1
# -------------------------------------------------------------------------------

# Listening Device

# Below we have a listening device. It lets us record something that is said and store it for later use. In general, this is how the device should be used:

# Listen for something, and if anything is said, record it for later use. If nothing is said, then do not record anything.

# Anything that is said is retrieved by this listening device via a block. If nothing is said, then no block will be passed in. The listening device can also output the most recent recording using a Device#play method.

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# Finish the above program so that the specifications listed above are met.


# -------------------------------------------------------------------------------
#                                  ANSWER: 1
# -------------------------------------------------------------------------------
# class Device
#   attr_reader :recordings
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen 
#     record(yield) if block_given?
#   end 

#   def play 
#     puts recordings.last 
#   end 

# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# ===============================================================================
# ===============================================================================
# ===============================================================================


# -------------------------------------------------------------------------------
#                                  QUESTION: 2
# -------------------------------------------------------------------------------
# Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." You should read the text from a simple text file that you provide. (We also supply some example text below, but try the program with your text as well.)


# -------------------------------------------------------------------------------
#                                  ANSWER: 2
# -------------------------------------------------------------------------------
# class TextAnalyzer 

#   def process
#     text = File.open('text_analyzer.txt', 'r')
#     yield(text.read)
#     text.close
#   end 
# end 

# analyzer = TextAnalyzer.new 
# analyzer.process { |text| puts "#{text.split("\n\n").count } paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines"}
# analyzer.process { |text| puts "#{text.split(' ').count} words" }


# ===============================================================================
# ===============================================================================
# ===============================================================================



# -------------------------------------------------------------------------------
#                                  QUESTION: 3
# -------------------------------------------------------------------------------
# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.


# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   puts "#{items.join(', ')}"
#   puts "Nice selection of food we have gathered!"
# end


# -------------------------------------------------------------------------------
#                                  ANSWER: 3
# -------------------------------------------------------------------------------
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { |foods| foods.each { |food| puts "Scrumptious #{food}."} }

# ===============================================================================
# ===============================================================================
# ===============================================================================



# -------------------------------------------------------------------------------
#                                  QUESTION: 4
# -------------------------------------------------------------------------------
# Write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.


# -------------------------------------------------------------------------------
#                                  ANSWER: 4
# -------------------------------------------------------------------------------

# birds = ['crow', 'finch', 'hawk', 'eagle']

# def types(birds)
#   yield birds
# end

# types(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(', ')}."
# end

# ===============================================================================
# ===============================================================================
# ===============================================================================

# -------------------------------------------------------------------------------
#                                  QUESTION: 5 
# -------------------------------------------------------------------------------
# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

# -------------------------------------------------------------------------------
#                                  ANSWER: 5
# -------------------------------------------------------------------------------
# 1. 
# gather(items) do |*produce, wheat |
#   puts produce.join(', ')
#   puts wheat
# end

# Output: 
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2. 
# gather(items) do |fruit,*veg,grain |
#   puts fruit
#   puts veg.join(', ')
#   puts grain
# end

# Output:
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


# 3. 
# gather(items) do |apples,*rest|
#   puts apples
#   puts rest.join(', ')
# end

# Output: 
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4. 
# gather(items) do |a,b,c,d|
#   puts [a,b,c,d].join(', ')
# end

# Output:
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
# ===============================================================================
# ===============================================================================
# ===============================================================================

# -------------------------------------------------------------------------------
#                                  QUESTION: 6
# -------------------------------------------------------------------------------
# Method to Proc





# -------------------------------------------------------------------------------
#                                  ANSWER: 
# -------------------------------------------------------------------------------
def convert_to_base_8(n)
  n.to_s(8).to_i 
end

base_8_proc = method(:convert_to_base_8).to_proc

[8, 10, 12, 14, 16, 33].map(&base_8_proc)

# => [10, 12, 14, 16, 20, 41]

# ===============================================================================
# ===============================================================================
# ===============================================================================