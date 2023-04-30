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
#                                 ANSWER: 3
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
#                                 QUESTION: 4
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
#                                 ANSWER: 4
#-------------------------------------------------------------------------------
# def divisors(num)
#   (1..num).select do |int|
#     num % int == 0
#   end 
# end 

# Further Exploration:

# def divisors(int)
#   keeps = []

#   1.upto(Math.sqrt(int)) do |div|
#     keeps.push(div, int / div) if int % div == 0 
#   end 

#   keeps.uniq.sort

# end 



#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 5
#-------------------------------------------------------------------------------
# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu






#-------------------------------------------------------------------------------
#                                 ANSWER: 5
#-------------------------------------------------------------------------------
# def lowercase?(char)
#   char == char.downcase 
# end 

# def valid_char?(char)
#   char.match(/[a-zA-Z]/)
# end 

# def decrypt(name)
#   chars = name.chars 

#   chars = chars.map do |char|
#     if valid_char?(char) && lowercase?(char)
#       char.ord + 13 < 122 ? (char.ord + 13).chr : (char.ord - 13).chr
#     elsif valid_char?(char) && !lowercase?(char)
#       char.ord + 13 < 90 ? (char.ord + 13).chr : (char.ord - 13).chr
#     else 
#       char 
#     end 
#   end 

#   chars.join
# end 

# file_path = 'names.txt'
# names = File.readlines(file_path)

# names.each do |name|
#   puts decrypt(name)
# end

#===============================================================================
#===============================================================================
#===============================================================================





#-------------------------------------------------------------------------------
#                                 QUESTION: 6
#-------------------------------------------------------------------------------
# Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns true.

# If the Array is empty, any? should return false, regardless of how the block is defined.

# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

# Examples:

# any?([1, 3, 5, 6]) { |value| value.even? } == true
# any?([1, 3, 5, 7]) { |value| value.even? } == false
# any?([2, 4, 6, 8]) { |value| value.odd? } == false
# any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# any?([1, 3, 5, 7]) { |value| true } == true
# any?([1, 3, 5, 7]) { |value| false } == false
# any?([]) { |value| true } == false


#-------------------------------------------------------------------------------
#                                 ANSWER: 6
#-------------------------------------------------------------------------------
# def any?(array)
#   array.each do |el|
#     return true if yield(el)
#   end 
#   false
# end 


#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 7
#-------------------------------------------------------------------------------
# Iterators: True for All?

# Write a method called all? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for all of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns false.

# If the Array is empty, all? should return true, regardless of how the block is defined.

# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

# Examples:

# all?([1, 3, 5, 6]) { |value| value.odd? } == false
# all?([1, 3, 5, 7]) { |value| value.odd? } == true
# all?([2, 4, 6, 8]) { |value| value.even? } == true
# all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# all?([1, 3, 5, 7]) { |value| true } == true
# all?([1, 3, 5, 7]) { |value| false } == false
# all?([]) { |value| false } == true

#-------------------------------------------------------------------------------
#                                 ANSWER: 7
#-------------------------------------------------------------------------------
def all?(array)
  array.each do |el|
    return false unless yield(el)
  end 
  true 
end 

#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 8
#-------------------------------------------------------------------------------
# Iterators: True for None?

# In this exercise, you will develop another of the methods in this family, none?

# Enumerable#none? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns true for any element, then #none? returns false. Otherwise, #none? returns true. Note in particular that #none? will stop searching the collection the first time the block returns true.

# Write a method called none? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns false for all of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns true.

# If the Array is empty, none? should return true, regardless of how the block is defined.

# Your method may not use any of the following methods from the Array and Enumerable classes: all?, any?, none?, one?. You may, however, use either of the methods created in the previous two exercises.

# Examples: 

# none?([1, 3, 5, 6]) { |value| value.even? } == false
# none?([1, 3, 5, 7]) { |value| value.even? } == true
# none?([2, 4, 6, 8]) { |value| value.odd? } == true
# none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# none?([1, 3, 5, 7]) { |value| true } == false
# none?([1, 3, 5, 7]) { |value| false } == true
# none?([]) { |value| true } == true

#-------------------------------------------------------------------------------
#                                 ANSWER: 8
#-------------------------------------------------------------------------------
def none?(array)
  array.each do |el|
    return false if yield(el)
  end 
  true 
end 

# or 

def none?(collection, &block)
  !any?(collection, &block)
end 
#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 9
#-------------------------------------------------------------------------------
# Iterators: True for one?

# Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for exactly one element, then #one? returns true. Otherwise, #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.

# Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns true a second time.

# If the Array is empty, one? should return false, regardless of how the block is defined.

# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

# Examples:

# one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# one?([1, 3, 5, 7]) { |value| true }           # -> false
# one?([1, 3, 5, 7]) { |value| false }          # -> false
# one?([]) { |value| true }                     # -> false

#-------------------------------------------------------------------------------
#                                 ANSWER: 9
#-------------------------------------------------------------------------------
# def one?(array)
#   total_true = 0

#   array.each do |el|
#     if yield(el) == true 
#       total_true += 1
#     end 
#   end 

#   total_true == 1
# end 

# # or

# def one?(collection)
#   seen_one = false 

#   collection.each do |element|
#     next unless yield(element)
#     return false if seen_one 
#     seen_one = true 
#   end 
#   seen_one 
# end 

# Our solution approaches this by using an each loop to iterate through the array, and a boolean local variable to keep track of whether we have seen a matching element yet. Each element is, in turn, yielded to the block; if the block returns a falsey value, we begin the next iteration. If the block returns a truthy value, we check to see if we have previously seen a matching element; if we have, we need to return false. Otherwise, we note the fact that we have a matching element, and continue iterating through the array.

#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 10
#-------------------------------------------------------------------------------
# Count Items

# Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

# Examples:

# count([1,2,3,4,5]) { |value| value.odd? } == 3
# count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# count([1,2,3,4,5]) { |value| true } == 5
# count([1,2,3,4,5]) { |value| false } == 0
# count([]) { |value| value.even? } == 0
# count(%w(Four score and seven)) { |value| value.size == 5 } == 2

#-------------------------------------------------------------------------------
#                                 ANSWER: 10
#-------------------------------------------------------------------------------
# def count(collection)
#   true_count = 0 

#   collection.each do |element|
#     true_count += 1 if yield(element)
#   end 

#   true_count 
# end 




# Further Exploration

# Write a version of the count method that meets the conditions of this exercise, but also does not use each, loop, while, or until.

# def count(collection)
#   true_count = 0 

#   0.upto(collection.size - 1) do |idx|
#     if yield(collection[idx])
#       true_count += 1
#     end 
#   end 

#   true_count 
# end 


# or 

# def count(coll, &block)
#   coll.select(&block).size 
# end 




#===============================================================================
#===============================================================================
#===============================================================================

