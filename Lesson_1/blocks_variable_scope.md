# Lesson 1.14: Blocks and Variable Scope 
---

## Closure and Binding

In order for a "chunk of code" to be passed around and executed later it must understand the surrounding context from where it was defined.

Example:

```ruby 
name = "Robert"
chunk = Proc.new { puts "Hi #{name}" }

# A Proc object is created and saved to local variable `chunk`
```
---
```ruby 
def call_me(some_code)
  some_code.call 
end 

name = "Robert"
chunk = Proc.new { puts "Hi #{name}" }

call_me(chunk)

# hi Robert
# => nil
```
---
---
### In the code above, how did our `Proc` object identified by `chunk` know how to handle the `name` variable?

- It appears that the `Proc` was pre-processed somehow.

- We'll use the same code, except we'll re-assign the name variable after the Proc has been initialized. Let's see if the chunk of code retains its old value of "Robert" or our new value of "Griffin III".

```ruby 
1:  def call_me(some_code)
2:    some_code.call
3:  end
4:  
5:  name = "Robert"
6:  chunk_of_code = Proc.new {puts "hi #{name}"}
7:  name = "Griffin III"        # re-assign name after Proc initialization
8:  
9:  call_me(chunk_of_code)
10:  
11:  # hi Griffin III
12:  # => nil
```
### The `Proc` is aware of the new value even though the varaible was reassigned *after* the `Proc` was defined. This implies that the `Proc` keeps track of its surrounding context, and drags it around wherever the chunk of code is passed. 

- ### This is the closure's **binding** which refers to its surrounding context/environment.
  - A closure must keep track of its binding to have all the information it needs to be executed later.
---
---

## Binding includes:
- local variables  
- method references
- constants
- other artifacts
- whatever it needs to execute correctly, it will drag around

** This is why the code above still works properly even though it seems to violate variable scoping rules. 

---
---
## Local variables that need to be accessed by a closure must be defined *before* the closure is created unless the local variable is explicitly passed to the closure when it is called.  (e.g., `some_proc.call(some_variable)`)

-  In the code from the last example, removing name = "Robert" on line 5 would change the binding of the Proc object on line 6: name would no longer be in scope since it is initialized only after the Proc is instantiated.
---
---
