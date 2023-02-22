# Lesson 2.4: Assertions

In the previous assignment we utilized `assert_equal` to make an assertion about the equality of two objects. Assertions can also check that a specific error is raised, that something was printed, that an object is of a particular class, or that something must be or not be `nil`. 

---
---

## Common Assertions and Descriptions
---
- `assert(test)`                      
  - fails unless `test` is truthy.
#
- `assert_equal(exp, act)`            
  - fails unless `exp == act`.
#
- `assert_nil(obj)`                   
  - fails unless `obj` is `nil`.
#
- `assert_raises(*exp) { ... }`       
  - fails unless block raises one `*exp`. 
#
- `assert_instance_of(cls, obj)`      
  - fails unless `obj` is an instance of `cls`. 
#
- `assert_includes(collection, obj)`  
  - fails unless `collection` includes `obj`. 
#

---

## Examples: 

We'll continue with our simple Car class, with a few modifications (notice we added an attr_accessor for :name). In the examples, we'll only include the test to save on space.

---
---

## assert
```ruby 
class Car 
  attr_accessor :wheels, :name 

  def initialize
    @wheels = 4
  end 
end 
```

```ruby 
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_car_exists
    car = Car.new 
    assert(car)
  end 
end

# Output below 

$ ruby car_test.rb
Started with run options --seed 19081

  1/1: [===================================] 100% Time: 00:00:00, Time: 00:00:00

Finished in 0.01414s
1 tests, 1 assertions, 0 failures, 0 errors, 0 skips

# this test passes because local variable `car` is truthy value (Car object).
```

---
---

## assert_equal
```ruby 
def test_wheels
  car = Car.new 
  assert_equal(4, car.wheels)
end

# Output below 

$ ruby car_test.rb
Started with run options --seed 1115

  1/1: [===================================] 100% Time: 00:00:00, Time: 00:00:00

Finished in 0.01580s
1 tests, 1 assertions, 0 failures, 0 errors, 0 skips

# this test passes because comparing expected value (4) with actual value (4)
```

---
---

## assert_nil 
```ruby 
def test_name_is_nil 
  car = Car.new 
  assert_nil(car.name)
end 

# this test passes because car.name evaluates to nil. 
```

---
---

## assert_raises 
```ruby 
def test_raise_initialize_with_arg 
  assert_raises(ArgumentError) do 
    car = Car.new(name: "Joey")
  end 
end 

# This code raises an ArgumentError due to initialize method not accepting any arguments. This test passes because correct error was raised. 
```

---
---

## assert_instance_of 
```ruby 
def test_instance_of_car 
  car = Car.new 
  assert_instance_of(Car, car)
end 

# This test passes because the second argument car, is an instance of the first argument (Car) class. 

# This test is best used with inheritance, this example is contrived.
```

---
---

## assert_includes 
```ruby 
def test_includes_car 
  car = Car.new 
  arr = [1, 2, 3]
  arr << car 

  assert_includes(arr, car)
end 

# This test passes as our collection (arr) contains our object (car)

# FYI assert_includes calls assert method twice behind the scenes.. so we will get two assertions rather than 1. 
  # This also applies to: 
    # refute_includes
    # assert_empty 
    # assert_match
  # oddity can be safely ignored. 
```

---
---

## Refutations 
Opposite of assertions: they *refute* rather than *assert*

Every assertion has a corresponding refutation: 
  - `assert`'s opposite is `refute`
    - `refute` passes if the object you pass to it is *falsey* 
    - take the same arguments 
    - `refute_equal`, `refute_nil`, `refute_includes`. 

These are not often used in practice. 

---
---

Blog article resource:
---

https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest

---
---