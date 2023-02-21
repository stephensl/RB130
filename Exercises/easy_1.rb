# -------------------------------------------------------------------------------
#                                  QUESTION: 1
# -------------------------------------------------------------------------------
# Enumerable Class Creation 

# Assume we have a Tree class that implements a binary tree.

# class Tree
#   ...
# end

# For this exercise, modify the Tree class to support the methods of Enumerable. You do not have to actually implement any methods -- just show the methods that you must provide.

# -------------------------------------------------------------------------------
#                                  ANSWER: 1
# -------------------------------------------------------------------------------
# class Tree 
#   include Enumerable

#   def each(array)
#     0.upto(array.size - 1) do |idx|
#       yield(array[idx])
#     end 

#     array 
#   end 

# ===============================================================================
# ===============================================================================
# ===============================================================================

# -------------------------------------------------------------------------------
#                                  QUESTION: 2
# -------------------------------------------------------------------------------
# Optional Blocks 

# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

# -------------------------------------------------------------------------------
#                                  ANSWER: 2
# -------------------------------------------------------------------------------
# def compute 
#   block_given? ? yield : "Does not compute."
# end 

# Further Exploration

# Modify the compute method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of compute, including a no-block call.

# def compute(arg)
#   block_given? ? yield(arg) : "Does not compute."
# end 

# compute(5) do |num|
#   puts num + 10
# end                   # 15
#                       # => nil 

# p compute(5) # Does not compute.

# p compute([1, 2, 3]) { |obj| obj.map { |x| x + 1 } }     # => [2, 3, 4]

# ===============================================================================
# ===============================================================================
# ===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 3
#-------------------------------------------------------------------------------
# Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# Examples: 

# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []

#-------------------------------------------------------------------------------
#                                 ANSWER: 
#-------------------------------------------------------------------------------

# def missing(array)
#   min = array.min 
#   max = array.max 

#   all_array = (min..max).to_a
#   all_array - array 
# end 

# def missing(array)
#   result = []

#   array.each_cons(2) do |first, second|
#     binding.pry
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end 
#   result
# end 


#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 
#-------------------------------------------------------------------------------

# Divisors

# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

# Examples

# divisors(1) == [1]
# divisors(7) == [1, 7]
# divisors(12) == [1, 2, 3, 4, 6, 12]
# divisors(98) == [1, 2, 7, 14, 49, 98]
# divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

#-------------------------------------------------------------------------------
#                                 ANSWER: 
#-------------------------------------------------------------------------------
# def divisors(num)
#   (1..num).select do |int|
#     num % int == 0
#   end 
# end 

# Further Exploration:



#===============================================================================
#===============================================================================
#===============================================================================
require 'pry'
ALPHABET = ('a'..'z').to_a

def decypher(name)
  name = name.downcase.chars
  result = []

  name.map do |char|
    next if char == ' ' 
    
    current_index = ALPHABET.find_index(char)
    #binding.pry
    new_index = current_index - 13

    result << ALPHABET[new_index]
  end 
  result.join
end 

p decypher("Nqn Ybirynpr")