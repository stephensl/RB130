# -------------------------------------------------------------------------------
#                                  QUESTION: 
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
#                                  ANSWER: 
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
#                                  QUESTION: 
# -------------------------------------------------------------------------------
# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.


# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   puts "#{items.join(', ')}"
#   puts "Nice selection of food we have gathered!"
# end







# -------------------------------------------------------------------------------
#                                  ANSWER: 
# -------------------------------------------------------------------------------
require 'pry'
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end 

gather(items) { |item| puts item }

# ===============================================================================
# ===============================================================================
# ===============================================================================








# -------------------------------------------------------------------------------
#                                  QUESTION: 
# -------------------------------------------------------------------------------






# -------------------------------------------------------------------------------
#                                  ANSWER: 
# -------------------------------------------------------------------------------





# ===============================================================================
# ===============================================================================
# ===============================================================================