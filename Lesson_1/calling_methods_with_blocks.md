# Lesson 1.3: Calling Methods with Blocks

### Breaking down a typical method that takes a block as an argument. 

```ruby 
1:  [1, 2, 3].each do |num|
2:    puts num 
3:  end 

[1, 2, 3] # Array object, calling object 

each # method invocation 

do |num| # beginning of block, with block parameter given

puts num # body of block functionality 

end # end of block 
```
# 
## *The block is an argument to the method call.*
#
#

## Examples of methods that commonly take blocks as arguments:
```ruby 
# Passing block to Integer#times method.
3.times do |num|
  puts num 
end 

# => 3


# Passing block to the Array#map method.
[1, 2, 3].map do |num|
  num + 1
end 

# => [2, 3, 4]


# Passing block to the Hash#select method.
{ a: 1, b: 2, c: 3, d: 4 }.select do |_, value|
  value > 2 
end 

# => {c: 3, d: 4 }
```
In considering the examples above, it is clear that, in some cases, the block affects the return value of the method. In other cases, the block is ignored in regard to the return value of the method. 

The first example using the `Integer#times` method returns `3` which is the calling object. The code written in the block is of no consequence to the return value. 

The second example using the `Array#map` method, we return a new array with values manipulated according to the code in the block (`num + 1`). In this case, the return value of the block on each iteration influences the return value of the method. 

The third example using the `Hash#select` method returns a new hash object based on the return value of the block in each iteration. 
#

# Questions:
*Why is it that the code in the block affects the return value of the method sometimes, but not others?*

- This is determined, not by the block, but by the method implementation. The `Array#map` method and the `Hash#select` method are both implemented in ways that utilize the return value of the block to formulate its return value. 
- The `Integer#times` method is implemented to return the calling object, regardless of the code written in the block. 