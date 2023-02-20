# Lesson 1.14: Blocks and Variable Scope

---
---

## Revisiting Local Variable Scope

Previously understood in terms of inner and outer scope in regard to blocks and methods.

```ruby 
level_1 = "outer most variable"  # local variable in outer scope 

[1, 2, 3].each do |n|            # block creates new scope
  level_2 = "inner variable" 

  ['a', 'b', 'c'].each do |n2|   # nested block, nested scope
    level_3 = "inner-most variable"

    # All three variables available here

  end # close block starting on line 16

  # level_1 accessible here
  # level_2 is accessible here
  # level_3 not accessible here

end # close block starting on line 13

# level_1 is accessible here (outer scope)
# level_2 not avaialable here 
# level_3 not available here.
```
---
---
---

## Closure and Binding 

In order to pass around a *closure*, which is a chunk of code to be executed later, it must understand the surrounding context from where it was defined. 

This *chunk of code* is represented by: 
  - `Proc` object 
  - lambda 
  - block 

---
---

### Example: 
```ruby 
name = "Robert"
chunk = Proc.new { puts "hi #{name}" }
```

The code above will not output anything. We've saved a chunk of code to a `Proc` object but have not executed it yet. We can now pass around local variable `chunk` and execute it as needed. 

```ruby 
def call_me(some_code)
  some_code.call # call will execute the chunk passed in 
end 

name = "Robert"
chunk = Proc.new { puts "hi #{name}" }

call_me(chunk)

# hi Robert     # outputs code from `Proc`
# => nil        # return value of execution is nil
```

### How did the code above deal with `name` variable?
  - The `name` variable was initialized outside of the method, so how can we resolve it?
  - It's as if the `Proc` object was pre-processed in some way.
---
---

Continued example: 

```ruby 
def call_me(some_code)
  some_code.call
end 

name = "Robert"
chunk = Proc.new { puts "hi #{name}" }
name = "Griffin III"

call_me(chunk)

# hi Griffin III
# => nil 
```
---
The `Proc` is aware of the new value even though the variable was reassigned after the `Proc` was defined.
  - The `Proc` keeps track of its surrounding context and drags it around wherever the chunk of code is passed. 
   - ***This is the closure's binding***, or surrounding environment/context.

A closure must keep track of its binding to have all the information needed in order to be executed later. 
  - Includes local variables, method references, other artifacts.
  - The closure drags around whatever it needs to execute correctly.

### Local variable initialization rule
  - Local variables that need to be accessed by a closure must be defined *BEFORE* the closure is created.
  
```ruby 
def call_me(some_code)
  some_code.call
end 

# name = "Robert"    # commented out initialization pre-closure
chunk = Proc.new { puts "hi #{name}" }
name = "Griffin III"

call_me(chunk)

# => undefined local variable or method `name' for main:Object (NameError)
```
The `name` local variable is now not in scope because it was not initialized prior to the instantiation of the `Proc` object.

---
---

***Bindings*** and ***closures*** are at the core of variable scoping rules in Ruby.
  - They are why "inner scopes can access outer scopes"

---
---
---
---