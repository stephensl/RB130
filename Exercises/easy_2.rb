#-------------------------------------------------------------------------------
#                                 QUESTION: 1
#-------------------------------------------------------------------------------
# From-To-Step Sequence Generator

# The Range#step method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.

# Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.

# Example:

# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

#-------------------------------------------------------------------------------
#                                 ANSWER: 1 
#-------------------------------------------------------------------------------
# def step(start_value, end_value, step_value)
#   current_value = start_value
  
#   until current_value > end_value do 
#     yield(current_value)
#     current_value += step_value 
#   end 

#   current_value
# end 


#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 2
#-------------------------------------------------------------------------------
# Zipper

# The Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. For example:

# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

# Example:

# zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

#-------------------------------------------------------------------------------
#                                 ANSWER: 2
#-------------------------------------------------------------------------------
# def zip(arr1, arr2)
#   result = []

#   0.upto(arr1.size - 1) do |idx|
#     result << [arr1[idx], arr2[idx]]
#   end

#   result 

# end 

#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 3
#-------------------------------------------------------------------------------
# map

# Write a method called map that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return a new Array that contains the return values produced by the block for each element of the original Array.

# If the Array is empty, map should return an empty Array, regardless of how the block is defined.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

# Examples:

# map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# map([]) { |value| true } == []
# map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]


#-------------------------------------------------------------------------------
#                                 ANSWER: 3
#-------------------------------------------------------------------------------

# def map(collection)
#   result = []

#   collection.each do |element|
#     result << yield(element)
#   end 

#   result 
# end 

#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 4
#-------------------------------------------------------------------------------
# count

# The Enumerable#count method iterates over the members of a collection, passing each element to the associated block. It then returns the number of elements for which the block returns a truthy value.

# Write a method called count that behaves similarly for an arbitrarily long list of arguments. It should take 0 or more arguments and a block, and then return the total number of arguments for which the block returns true.

# If the argument list is empty, count should return 0.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

# Examples:

# count(1, 3, 6) { |value| value.odd? } == 2
# count(1, 3, 6) { |value| value.even? } == 1
# count(1, 3, 6) { |value| value > 6 } == 0
# count(1, 3, 6) { |value| true } == 3
# count() { |value| true } == 0
# count(1, 3, 6) { |value| value - 6 } == 3


#-------------------------------------------------------------------------------
#                                 ANSWER: 4
#-------------------------------------------------------------------------------
# def count(*args)
#   total = 0 
  
#   args.each do |item|
#     total += 1 if yield(item)
#   end 

#   total 
# end 

# Note that we use *arguments in the method definition; this lets us treat the list of arguments as an Array of values, which means the rest of our count method does not need to change (other than the change in variable name).

#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 5
#-------------------------------------------------------------------------------


