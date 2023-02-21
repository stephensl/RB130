# Enumerable Class Creation 

# Assume we have a Tree class that implements a binary tree.

# class Tree
#   ...
# end

# For this exercise, modify the Tree class to support the methods of Enumerable. You do not have to actually implement any methods -- just show the methods that you must provide.

#
#
#

# Answer: 

# class Tree 
#   include Enumerable

#   def each(array)
#     0.upto(array.size - 1) do |idx|
#       yield(array[idx])
#     end 

#     array 
#   end 


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

# Optional Blocks 

# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

# 
# 
#

# Answer: 

# def compute 
#   block_given? ? yield : "Does not compute."
# end 

# Further Exploration

Modify the compute method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of compute, including a no-block call.