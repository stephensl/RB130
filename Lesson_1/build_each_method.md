# Lesson 1.6: Build an `#each` method
---
Typical functionality: 
```ruby 
[1, 2, 3].each { |num| "do nothing" }

# => [1, 2, 3]      # returns calling object 
```
---
My implementation to achieve functionality of `Array#each`: 
```ruby 
def each(array)
  0.upto(array.size - 1) do |idx|
    yield(array[idx])
  end 

  array 
end 

each([1, 2, 3]) do |num|
  puts num 
end 

# 1
# 2
# 3
# => [1, 2, 3]
```
---
---

The magic of the implementation of the `#each` method is that it does **not** dictate what action to perform when iterating through the array. The `#each` method is solely focused on iterating through the array. The method user can then pass in a block to the method that achieves desired behavior with great flexibility. 