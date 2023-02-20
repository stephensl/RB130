# Lesson 1.15: Symbol to Proc
---

## Transforming all items in collection
```ruby 
[1, 2, 3].map do |num|
  num.to_s 
end 

# => ["1", "2", "3"]
```
Return value is new array where every element is now a string.

This code could also be written as such: 

`[1, 2, 3].map(&:to_s)` 

The above code iterates through every element in the array and calls `to_s` on it, then saves the result to a new array. After iteration is complete, the new array is returned. We can then chain methods onto the return value if desired.

`[1, 2, 3].map(&:to_s).map(&:to_i)`

This code will return a new array with elements transformed to strings, then, will return a new array with each element transformed back to integers. 

The `&` must be followed by a symbol name for a method that can be invoked on each element. 

***This shortcut cannot be used for methods that take arguments.***

---
---

***This shortcut will work with any collection method that takes a block.***

```ruby 
["hello", "world"].each(&:upcase!) # => ["HELLO", "WORLD"]
[1, 2, 3].select(&:odd?) # => [1, 3]
[1, 2, 3].select(&:odd?).any?(&:even?)  # => false
```

---
---

## `Symbol#to_proc`
What's happening with the shorthand syntax...

`&:to_s` gets converted to...

`{ |n| n.to_s }`

Related to the use of `&` with explicit blocks, but in this case, we are not working with explicit blocks which can be identified by looking for an `&` in the parameter list for a method. 
  - `def method(&block)` 

Instead, we are applying the `&` operator to an object, which is possibly referenced by a variable. 

When this occurs, Ruby attempts to convert the object into a block
  - If object is a `Proc` it is quite easily converted. 
    - If not, Ruby must first convert it to a `Proc`. 
    - We call `to_proc` on the object which returns a `Proc` which can be easily converted to a block. 
---

Examples: 
- Using `:to_s` Ruby is being told to convert the symbol `to_s` to a block. 
  - First calls `Symbol#to_proc` to convert the symbol to a `Proc` then converts the `Proc` to a block. 

```ruby 
# Two steps occur in one line 

def my_method
  yield(2)
end 

my_method(&:to_s) 
# Turns symbol into a `Proc` then `&` turns `Proc` into a block.

# => "2"
```

Below, the example breaks it into two steps:
```ruby 
def my_method
  yield(2)
end 

a_proc = :to_s.to_proc  # explicit call `to_proc` on symbol
my_method(&a_proc) # convert `Proc` into block, then pass block in

# => "2"
```

---
---
### You can use a shortcut when calling methods with blocks by using the symbol-to-proc trick. 