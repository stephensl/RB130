# Lesson 1.8: Build `#reduce` method
---

Typical functionality: 
  - Main goal: fold or accumulate collection into 1 object.
```ruby 
[1, 2, 3].reduce do |acc, num|
  acc + num 
end 

# => 6
```
The `reduce` method iterates through the array, and yields two arguments to the block. The first argument is an accumulator object, and the second is the current element. 

The return value of the block is then assigned to the accumulator object

```ruby 
1:  [1, 2, 3].reduce do |acc, num|
2:    acc + num if num.odd?           # problematic code
3:  end 

# This is problematic because the return value of the block is assigned to the accumulator object, which in the second iteration is nil. Then when the block attempts to use the + method, we get an error for an undefined method for Nil class. 
```

```ruby 
1:  [1, 2, 3].reduce do |acc, num|
2:    acc + num 
3:  end 
```

This method sets the accumulator to the return value of the block, and then passes the accumulator to the block on the next yield. Code execution is as follow for the example above.:
- Line 1, invoke the `#reduce` method on an `Array` object and pass in a block with two parameters.
  - First two elements are passed to the block and assigned to `acc` and `num` respectively
  - At this point `acc` block parameter references `1`, and `num` references `2`. 
- Line 2, `if` conditional evaluates if `num` is odd, evaluates to `true`
  - `acc` invokes the `+` method and passes in `num` as an argument. 
  - `1 + 2` == `3` so `3` is the return value of the block. 
- Return value of the block `3` is assigned to accumulator
- Line 1, continues iteration with element at index 2. 
  - `num` is assigned to reference `3`
- Line 2, `acc + num` (3 + 3) evaluates to 6, which is the return value of the block
- Return value assigned to accumulator and returned. 

---
---
---
---
## Default accumulator value
```ruby 
[1, 2, 3].reduce(10) do |acc, num|
  acc + num 
end 

# => 16 
```
If default value argument given.. first iteration `acc` is default value, `num` is element at index `0`. 

---
---
---
My implementation: 
- Must take at least one argument representing the array being operated on.
- Must provide optional argument that represents default value for accumulator. 

```ruby 
def reduce(array, default=0)
  accumulator = default 

  0.upto(array.size - 1) do |idx|
    accumulator = yield(accumulator, array[idx])
  end 

  accumulator 
end 

#
#

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
```
