# Lesson 1.5: Build your own `#times` method.
---
---
Basic functionality:
```ruby 
5.times do |num|
  put num 
end 

0 
1
2
3
4
# => 5
```
# 
My implementation: 
```ruby 
1:  def times(num)
2:    (0...num).each do |idx|
3:      yield(idx)
4:    end 
5:  
6:    num 
7:  end 
8:  
9:  times(5) do |num|
10:    puts num 
11:  end 
12:  
13:  0
14:  1
15:  2
16:  3
17:  4
18:  => 5
``` 
In the code above: 
- Line 9 we invoke the `#times` method and pass in the integer `5` and a block as arguments. 
- Line 1, argument `5` set to method parameter `num`. 
- Line 2, range from `0` to one less than `num`..invoke `each` method and pass `0` into the block for the first iteration, assigned to block parameter `idx`. 
- Line 3, yield to the block with one block argument `idx`. 
- Line 9, block parameter `num` assigned to `idx`. 
- Line 10, invoke `puts` method and output `num` which is `0` on first iteration. 
- Line 11, end of block, return to Line 2.
- Line 2, next number in range `1` passed to block and assigned to block parameter `idx`. 
- Line 3, yield to block with one argument `idx`.
- Line 9, block parameter `num` assigned to `idx`. 
- Line 10 invoke the `puts` method and output `num` which is `1` on second iteration. 
- Line 11, end of block, return to Line 2. 
- Repeat until end of range. 
- Line 6, return argument...`5`. 
---
---
---
---
### Two roles 
- Method implementer
- Method user 

Method implementer creates generic `#times` method that iterates from 0 to one less than the argument and returns the argument. It is designed to yield to a block, that can be written at invocation time depending on the use case of the method user. 