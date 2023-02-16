# Lesson 1.4: Writing Methods that take Blocks 
#

## *Every method in Ruby takes a block.* 
- Every method can take an optional block as an implicit argument.
#

Invocation of a method with a block does not conflict with expected arguments. 
```ruby 
1:  def echo(str)
2:    str 
3:  end 
4:  
5:  echo('hello')  # => 'hello'
6:  echo('hello', 'world')  # => ArgumentError wrong number of arguments (2 for 1)
7:  echo('hello') { puts 'hi' }  #=> 'hello'
```
The last example above does not throw an error because even though the block is an *argument* to the method, as is the string object `'hello'`, it is an implicit argument and is not counted toward or against the number of expected explicit arguments. 

`echo('hello', 'world') { puts "hi" }`  # => ArgumentError wrong number arguments (2 for 1)
* the error here shows that two arguments were given when one was expected. This shows that the block is not considered part of the required explicit arguments. 

---
---
---

## Yielding
One way to invoke the passed in block argument from within the method is by using the keyword `yield`. 

```ruby 
def echo_with_yield(str)
  yield 
  str 
end 

echo_with_yield("hello") { puts "world" }  # world (output)
                                           # => "hello"  (returned)


# The yield keyword executes the block. 
```
Utilizing the `yield` keyword within the method allows developers to write more flexible code and inject additional code into the middle of a method by passing in a block to the method without changing any of the method implementation details. 
#

### LocalJumpError
- Often occurs if the method includes a `yield` keyword, but a block is not given. 
```ruby
echo_with_yield('hello')

# => LocalJumpError : no block given (yield)
```

In order to mitigate this, we can wrap the `yield` keyword in a conditional to execute only if a block is provided. 
```ruby 
def echo_with_yield(str)
  yield if bock_given?
  str
end 
```
This code utilizes the `Kernel::block_given?` method. This allows us to use the `echo_with_yield` method with or without a block as the conditional statement will determine execution. 

---
---

## Passing execution to the block 
```ruby 
1 :  def say(words)           # 2
2 :    yield if block_given?  # 3
3 :    puts "> " + words      # 5
4 :  end                      # 6
5 :  
6 :  say("hi there") do       # 1
7 :    system 'clear'         # 4
8 :  end 
9 :  
10:  # => clears screen first
11:  # => outputs: "> hi there"

# comments on right side are order of execution
```
Here we define a method `say` that takes one argument. Line 2 yields execution to the block *if* a block is passed in as an argument. Line 3 we invoke the `puts` method on a concatenated string which includes the argument passed in to the method. 

On line 6 we invoke the `say` method and pass in the string `"hi there"` and a block as arguments. 

- Execution begins on line 6 when the `say` method is invoked.
- Line 1, the method local variable `words` is assigned to the string `"hi there"`. The block is passed in implicitly without being assigned to a variable. 
- Line 2, evaluate conditional..evaluates to true, yields to block. 
- Line 7 in the block is executed, clearing the screen.
- After block finished executing, Line 3 executed, outputs string. 
- The method ends, `nil` is returned as `puts` is last evaluated expression of method. 

---
---

## Yielding with an argument
Consider the following example:
```ruby 
1:  3.times do |num|
2:    puts num 
3:  end 
``` 
`|num|` on line 1 is the **block parameter**

`num` is the **block local variable**
# 

```ruby 
def increment(num)
  num + 1
end 

increment(5)  # => 6
```
We want to update this method to allow users to take some action with the newly incremented number at method invocation time. We want to allow flexibility at method usage/invocation time. We will update the method to yield to a block, and pass the incremented number into the block. 

```ruby 
 1:  def increment(num)
 2:    if block_given? 
 3:      yield(num + 1)
 4:    end 
 5:    num + 1
 6:  end 
 7:  
 8:  increment(5) do |num|
 9:    puts num 
10:  end 
11:  
12:  # => output: 6
13:  # => return: 6
```
Execution of the above code is as follows: 
- Line 8, method invocation 
- Line 1, sets `5` to the method local variable `num`. 
- Line 2, evaluate if block given, evaluates to `true`. Move to line 3.
- Line 3, yield to block and pass in (`num + 1`) to the block. `6` is block argument. 
- Line 8, parameter `num` is assigned to `6`. 
- Line 9, invocation of `puts` and pass in `num` as argument. Outputs block local variable `num` (`6`).
- Line 10, execution of block ends.
- Line 4, end of `if` statement.
- Line 5, returns value of the incremented argument to line 8. 
- Program ends and return value is not used. 

*calling a block is similar to calling another method* 

---
---
---

## Block Arguments 

### Passing incorrect number of arguments: 
```ruby 
def test
  yield(1, 2)     # passing two block arguments at invocation time
end 

test { |num| puts num }     # expecting 1 parameter in block implementation

# => 1
```
In the code above, the method is written to pass 2 arguments to the block at invocation time. The way we invoke the method with a block is set to take only one block parameter. Instead of throwing an error, `1` is output, which is the first argument passed to the block. The other is ignored.
#

```ruby 
1:  def test
2:    yield(1)    # passing one block argument at block invocation time
3:  end 
4:  
5:  test do |num1, num2|     # expecting 2 parameters in block implementation.
6:    puts "#{num1} #{num2}"
7:  end 
8:  
9:  # => 1
```
In the code above we define our method to include the keyword `yield` which takes one argument to be passed to the block. We invoke the `test` method on line 5 and pass in a block as an argument with two parameters `num1` and `num2`. The block invokes the `puts` method and outputs a string with the two block local variables interpolated. This method outputs `1` as the block local variable `num2` is `nil`, so the string interpolation converted that to an empty string..so we get `1` and an extra space.
The return value of the `test` method is `nil` as the last evaluated expression was the block, which returns `nil`. 

---
---

## Arity 
- ### The rule regarding the number of arguments you must pass to a block, `proc` or `lambda` is called its **arity**. 

- ### Blocks and `proc`s have a *lenient arity*, which is why no error is raised when too many or too few arguments are passed in to a block. 

- ### Methods and `lambda`s have a *strict arity*, which means you must pass in the exact number of arguments that the method or `lambda` expects. 

### Methods enforce the argument count, but blocks do not. 

---
---
---
---

## Return value of yielding to the block
```ruby 
def compare(str)
  puts "Before: #{str}."
  after = yield(str)
  puts "After: #{after}."
end 

compare('hello') { |word| word.upcase }

#  Before: hello
#  After: HELLO 
# => nil 
```
The code above assigns the return value of the block to method local variable `after`. The return value from the block is `HELLO`. `nil` is returned as `puts` is the last expression evaluated and returns `nil`. 

### Similar to methods, blocks have a return value determined by the last expression in the block. Just like normal methods, blocks can either mutate the argument with a destructive method call or the block can return a value. 

```ruby 
compare('hello') { |word| word.slice(1..2) }

# Before: hello 
# After : el 
# => nil 

compare('hello') { |word| "nothing to do with anything" }

# Before: hello 
# After : nothing to do with anything
# => nil 

compare('hello') { |word| puts "hi" }

# Before: hello 
# hi
# After: 
# => nil 
```
In the last example, the return value of the block is `nil`, which is assigned to method local variable `after` in the method implementation. When `nil` is interpolated in a string, it evaluates to an empty string, which is why we see the output we do. 

---
---
---
---

## When to use blocks in my own methods
--
### 1. Deferring some implementation code to method invocation decision

- There are two roles involved with any method 
  - method implementor 
  - method user
  - *may be same person- developer as user of method*

- Its possible that the method implementor is not certain of how the method will be called, and wants to leave the decision up to the method user at method invocation time. 

Example without using blocks: 
```ruby 
def compare(str, flag)
  after = case flag 
          when :upcase
            str.upcase 
          when :capitalize
            str.capitalize 
          # etc...
          end 

  puts "Before: #{str}"
  puts "After: #{after}"
end 

compare("hello", :upcase)

# Before: hello 
# After : HELLO
# => nil 
```
This example is not nearly as flexible as providing way for method user to refine the method implementation without actually modifying the method implementation for anyone else. 

By using a block, the method implementor can defer the decision of which flags to support and let the user decide at method invocation time. 

Many of the core library's most useful methods are built generically, allowing us to refine the method through a block at invocation time. 

- for example `Array#select` can take any expression that evaluates to a boolean in the block parameter.This is in contrast to defining countless methods for countless specific scenarios.. `select_odds`, `select_greater_than(num)` etc. 
---
---
###  2. Sandwich code: methods that need to perform some "before" and "after" actions
- Generic method that performs some "before" and "after" actions.
```ruby 
def time_it
  time_before = Time.now 
  # do something 
  time_after = Time.now 

  puts "It took #{ time_after - time_before } seconds. 
end 
```
The responsibility of our method starts and stops at timing the action, without regard for what the action actually is..that is up to the method user. This method allows users to specify any action and use our method to time that action. 
```ruby 
def time_it 
  time_before = Time.now 
  yield 
  time_after = Time.now 
  
  puts "It took #{ time_after - time_before } seconds."
end 

time_it { sleep(3) }     # It took 3.003767 seconds
                         # => nil 

time_it { 'hello world' } # it took 3.0e-06
                          # => nil 
```

### Sandwich code is useful in timing, logging, notification systems, resource management. 

- Example using the `File::open` method. 
```ruby 
# creates a file called "some_file.txt" with write/read permissions
my_file = File.open("some_file.txt", "w+") 
# write to this file using my_file.write
my_file.close 
```
The final line closes the file and frees up resources. 

- Since we always want to close files, File::open can also take a block, and will automatically close the file after the block is executed.
- The method implementor opens the file, yields to the block, then closes the file. This means the user only needs to pass in the relevant file manipulation code in the block without worrying about closing the file. 
```ruby 
File.open("some_file.txt", "w+") do |file|
  # write to this file using file.write
end 
```
---
---
---

## Methods with an explicit block parameter

- Every method, regardless of its definition, takes an implicit block. It may ignore it, but it accepts it. 
- There are times when you want a method to take an **explicit block**
  - An **explicit block** is a block that gets treated as a named object-- it gets assigned to a method parameter so that it can be managed like any other object.
  - An explicit block can be reassigned, passed to other methods, and invoked many times. 

### Defining explicit block parameters

To define an explicit block, you add a parameter to the method definition where the name begins with an `&` character. 
```ruby 
def test(&block)
  puts "What's &block? #{block}"
end 
```
The `&` character is a special parameter that converts the block argument to a "simple" `Proc` object.
  - We drop the `&` when referring to the parameter inside the method.
```ruby 
test { sleep(1) }

# What's &block? #<Proc:0x000001e7ea9da020 sandbox.rb:5>
# => nil
```
- In the above code, the `block` local variable is now a `Proc` object. 

### Benefits of explicit block  vs implicit 
- Greater flexibility 
  - We now have a variable for the explicit block 
  - We can pass the block to another method

```ruby 
1 :  def test2(block)
2 :    puts "hello"
3 :    block.call    # calls the block that was originally passed to test() method
4 :    puts "goodbye"
5 :  end 
6 :  
7 :  def test(&block)
8 :    puts "1"
9 :    test2(block)
10:    puts "2"
11:  end 
12:  
13:  test { |prefix| puts "xyz" }
14:  
15:  # 1
16:  # hello
17:  # xyz
18:  # good-bye
19:  # 2

# Note that you only need to use & for the block parameter in #test. 
# Since block is already a Proc object when we call test2, no conversion is needed.
```
Execution is as follows: 
- Line 13, method invocation with a block. 
- Line 7, block assigned to parameter `&block`. 
- Line 8, outputs `1`
- Line 9, `test2` is invoked and `block` passed in as parameter
  - this is the same block originally passed in to `test`... `{ |prefix| puts "xyz" }`
- Line 1, `block` assigned to `test2` method local variable `block`
- Line 2, outputs `hello` 
- Line 3, block is called and outputs `xyz`
- Block ends, return to line 4.
- Line 4, outputs goodbye
- `test2` method ends, return to line 10. 
- Line 10 outputs `2`
- Execution completes and `nil` is returned

---
---
### Arguments to explicit block 
You can pass arguments to the explicit block by using them as arguments to `call` method. 

```ruby 
def display(block)
  block.call(">>>") # passing the prefix argument to the block 
end 

def test(&block)
  puts "1"
  display(block) # block is already a Proc object at this point. No need to convert via &
  puts "2"
end 

test { |prefix| puts prefix + "xyz" }

# 1
# >>>xyz
# 2
```
---
## Ruby converts blocks passed in as explicit blocks to a simple `Proc` object.. this is why we need to use `#call` to invoke the `Proc` object. 
---
---
---
---

## Using Closures

Closures retain a memory of their surrounding scope and can use and even update variables in that scope when they are executed, even if the block, `Proc`, or `lambda` is called from somewhere else..

```ruby 
1 :  def for_each_in(arr)
2 :    arr.each { |element| yield element }
3 :  end 
4 :  
5 :  arr = [1, 2, 3, 4, 5]
6 :  results = [0]
7 :  
8 :  for_each_in(arr) do |number|
9 :    total = results[-1] + number 
10:    results.push(total)
11:  end 
12:  
13:  p results  # => [0, 1, 3, 6, 10, 15]
```
Walkthrough of code above:
- Line 8, method invocation with an argument `arr` and a block.
- Line 1, method parameter `arr` assigned to array object `arr`. 
- Line 2, invoke `Array#each` method on `arr` and pass first element to block. 
  - `1` assigned to block parameter `element` and yield to block with `element` as argument.
  - Line 8, `element` which is `1`, assigned to block parameter `number`
  - `total` reassigned to `results[-1] + number` which evaluates to `1`.
  - push `total` to results array
  - end block execution and back to Line 2 for next iteration

---
---
### Returning closures 
```ruby 
1:  def sequence
2:    counter = 0 
3:    Proc.new { counter += 1 }
4:  end 
5:  
6:  s1 = sequence 
7:  
8:  p s1.call # => 1
9:  p s1.call # => 2
10:  p s1.call # => 3
11:  puts 
12:  
13:  s2 = sequence 
14:  p s2.call # => 1 
15:  
16:  p s1.call # => 4
17:  
18:  p s2.call # => 2
```
In the code above, `#sequence` returns a `Proc` object that is invoked via the `#call` method. 

- On line 6 we assign the return value of `#sequence` to local variable `s1`. 
  - `s1` now references a `Proc` object. 
  - The `Proc` object forms a closure with the local variable `counter`.
- Line 8 invoke the `p` method on the return value of invoking the `#call` method on `s1` which is our `Proc` object. 
- Our `Proc` object returns `1`. 
- Line 9 we invoke our `Proc` again, this time `counter` is incremented to `2` and returned. 
- Line 10, repeats this and `counter` is incremented to 3. 
--- 
- Line 13 we initialize local variable `s2` to the return value of `sequence`. 
- A new `Proc` object is now stored in `s2` with its own `counter` independent of the `counter` in `s1`. 
- Line 14 we call our new `Proc` object, which returns `1`. 
- Line 16 shows that our `Proc` object stored in `s1` is still functioning appropriately and returns `4`, as this `Proc` object's binding includes its own `counter` separate from `s2`.
- Line 18, invoke the `Proc` stored in `s2` and `2` is returned. 

This example shows that we can create multiple `Proc` objects from a common method and each will have its own independent copy of the variables due to closures. 
---
---
---
---
## Summary 
- Blocks are one way Ruby implements closures. 
- Closures are a way to pass around chunks of code and execute later. 
- Blocks can take arguments but have lenient arity. 
- Blocks have a return value just like normal methods. 
- Blocks allow deferment of implementation decisions to invocation time. 
- Blocks provide flexibility for refining methods for specific use case. 
  - Generic methods may be defined and implemented with specialized behavior based on the block.
- Blocks are useful in "sandwiching" code, such as closing a `File` automatically. 
- Methods and blocks can return a chunk of code by returning a `Proc` or `lambda`. 