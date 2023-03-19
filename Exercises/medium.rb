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

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

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
#                                  ANSWER: 6
# -------------------------------------------------------------------------------
# def convert_to_base_8(n)
#   n.to_s(8).to_i 
# end

# base_8_proc = method(:convert_to_base_8).to_proc

# [8, 10, 12, 14, 16, 33].map(&base_8_proc)

# => [10, 12, 14, 16, 20, 41]

# ===============================================================================
# ===============================================================================
# ===============================================================================

# -------------------------------------------------------------------------------
#                QUESTION: RB 101/109: Medium 2 Bubble Sort Review 
# -------------------------------------------------------------------------------
 # Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

 # We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

 # Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

# Examples: 

# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)



# -------------------------------------------------------------------------------
#                   ANSWER: Bubble Sort 101/109 Medium 2 Review
# -------------------------------------------------------------------------------
=begin
P: write a bubble sort method that sorts an array in place. 

  rules: 
    - array will be mutated in place
    - array will contain at least 2 elements 
    - the program ends when elements are sorted smallest to largest
    - iterative method, that swaps position of elements as needed each pass
    - return value should be same array object


E:

  array = [3, 2, 5, 1]

  First pass: (start_idx 0 up to arr size - 2) (end idx start_idx + 1)
    - compare array[0] and array[1]
      - 3 > 2 so swap places 
      - [2, 3, 5, 1]
    - compare array[1] and array[2]
      - 3 < 5 so no swap 
      - [2, 3, 5, 1]
    - compare array[2] and array[3]
      - 5 > 1 so swap places
      - [2, 3, 1, 5]

  Second pass: [2, 3, 1, 5]
    - compare array[0] and array[1]
      - 2 < 3 no swap
      - [2, 3, 1, 5]
    - compare array[1] and array[2]
      - 3 > 1 swap 
      - [2, 1, 3, 5]
    - compare array[2] and array[3]
      - 3 < 5 no swap 
      - [2, 1, 3, 5]
  
  Third pass: [2, 1, 3, 5]
    - compare array[0] and array[1]
      - 2 > 1 swap
      - [1, 2, 3, 5]

  ... completes third pass, then completes 4th pass with no swaps and terminates.

D: 
  - array... returns same array
  - working with integers or strings primarily in test cases
  - must be able to be compared 

A: 
  - set local variable to track if element swapped or not during iteration
  - set start index range 0 to size of array - 2 (second to last element)
  - set end index as start_index + 1
  - iterate through the array
    - compare elements at start and end indexes
      - if element at start index > element at end index
          - swap 
          - set swapped tracker variable to true if not already
      - continue iteration to end of array 
  - check if swapped is true
        - if so, set to false and begin iteration again 
  - continue until complete iteration and swapped is false. 
  - return array 
=end

# def bubble_sort!(array)
#   swapped = false

#   loop do 
#     0.upto(array.size - 2) do |start_idx|
#       first, second = array[start_idx], array[start_idx + 1]
      
#       if first > second 
#         array[start_idx], array[start_idx + 1] = array[start_idx + 1], array[start_idx]
#         swapped = true 
#       end 
#     end 
#     break unless swapped
#     swapped = false 
#   end 

#   return array 
# end 

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)




# ===============================================================================
# ===============================================================================
# ===============================================================================




# -------------------------------------------------------------------------------
#                                  QUESTION: 7
# -------------------------------------------------------------------------------

# utilizing this solution: refactored from above.

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end

# Your task in this assignment is to modify #bubble_sort! so it takes an optional block that determines which of two consecutive elements will appear first in the results.

# -------------------------------------------------------------------------------
#                                  ANSWER: 7
# -------------------------------------------------------------------------------

=begin
The goal is to modify the implementation of bubble_sort! to take an optional block that lets the method user sort items according to the given block. 

rules: 
  - block should take two parameters, one for each consecutive element 
  - return value of the block should be true or false, if true

  
=end



# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if block_given? 
#         next if yield(array[index - 1], array[index])
#       else  
#         next if array[index - 1] <= array[index]
#       end 
      
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# All return true

# 
#
#
#


# Further Exploration 

# Modify your solution so it only passes one element to the block at a time; the block should perform some sort of transformation to the argument, and #bubble_sort! itself should just use <= to compare two values. In other words, you should be able to call #bubble_sort! like this:

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if block_given?
#         next if yield(array[index - 1]) <= yield(array[index]) # change here
#       else
#         next if array[index - 1] <= array[index]
#       end

#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end



# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |value| value.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)


#===============================================================================
# ===============================================================================
# ===============================================================================