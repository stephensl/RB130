# Lesson 1.7: Build `#select` method
---

Typical functionality: `Array#select` iterates through the array starting with the element at index `0` and passes each element to the block. This method returns a new array object which is comprised of elements for which the return value of the block evaluates to `true`. 

```ruby 
array = [1, 2, 3]

array.select { |num| num.odd? }  # => [1, 3]
array.select { |num| puts num }  # => []
array.select { |num| num + 1 }   # => [1, 2, 3]
```

--- 
### Challenge: 
- Implement a `select` method that mirrors the `Array#select` behavior. 

Method should be invoked in this way: 
```ruby 
array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
```
My implementation: 
```ruby 
1:  def select(array)
2:    results = []
3:  
4:    0.upto(array.size - 1) do |idx|
5:      current_element = array[idx]
6:      results << current_element if yield(current_element)
7:    end 
8:  
9:    results 
10:  end
11:  


12:  array = [1, 2, 3, 4, 5]
13:  
14:  array.select { |num| num.odd? }  # => [1, 3, 5]
15:  
16:  array.select { |num| puts num }       # Outputs: 1
17:                                        #          2
18:                                        #          3
19:                                        #          4
20:                                        #          5
21:                                        
22:                                        # Returns: []
23:  
24:  array.select { |num| num + 1 }   # => [1, 2, 3, 4, 5]
``` 

- Line 12: initialize local variable `array` to reference `Array` object `[1, 2, 3, 4, 5]`
- Line 14, invoke `select` method on `array` and pass in block. 
- Line 1, local variable `array` assigned to method parameter `array`
- Line 2, initialize empty array `results`
- Line 4, iterate through range from 0 up to one less than size of the array
  - Pass in block to the `#upto` method which includes one block parameter `idx`. 
  - `idx` references `0` on the first iteration (based on `upto` method implementation)
- Line 5, initialize block local variable `current_element` to reference the element at `idx` of `array`. 
- Line 6, add `current_element` to `results` if it returns true from the block. 
  - `yield` to block with one argument `current_element`. which references `array[idx]` which evaluates to `1` on the first iteration.
- Line 14, block parameter `num` assigned to `current_element` (`1`)
  - Invoke the `Integer#odd?` method on `num`, which returns `true`. 
- Line 6, conditional `if_yield` evaluates to `true`, and `current_element` added to `results`. 
- Line 4, based on `upto` method, `1` is assigned to block parameter `idx`. 
- Repeat process. 
- The elements that returned `true` from the block are added to `results` while those that evaluated to `false` are not. Line 9 returns the `results` array containing those values. 

---
---
