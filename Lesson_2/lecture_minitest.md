# Lesson 2.3: Lecture: Minitest

## Minitest 
- Ruby's default testing library and is part of Ruby's standard library. 
- Bundled gem
  - shipped with the default Ruby installation
  - maintained outside of the Ruby core team 
  - can be uninstalled if necessary

Minitest uses simpler and more straightforward syntax than RSpec. RSpec is a *Domain Specific Language (DSL)* for writing tests. 

Minitest can use a DSL but can also be used in a way that reads like ordinary Ruby code. 

---
---

## Vocabulary 

**Test Suite**: the entire set of tests that accompanies your program or application. All the tests for a project.

**Test**: situation or context in which tests are run. For example, a test to make sure you get an error message after trying to log in with incorrect password. 
  - A test can contain multiple assertions.

**Assertion**: the actual verification step to confirm that the data returned by the program or application is what is expected. You make one or more assertions within a test. 

---
---

## First Test 

Let's start with a simple Car class. Create a file called car.rb on your file system, and include the following code.

```ruby
class Car
  attr_accessor :wheels

  def initialize
    @wheels = 4
  end
end
```

Now, in the same directory, create another file called car_test.rb with the following code.

```ruby 
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end
```

If you run the test file with ruby car_test.rb, you should see this output:

```ruby 
$ ruby car_test.rb

Run options: --seed 62238

# Running:

CarTest .

Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```
Look at the last line: 1 assertions, 0 failures, 0 errors. That means the assertion was executed, and there weren't any problems. That's really the core of using Minitest!

---
---

## What's in the test file?
```ruby 
1:  require 'minitest/autorun'
2:  
3:  require_relative 'car'
4:  
5:  class CarTest < MiniTest::Test
6:    def test_wheels
7:      car = Car.new
8:      assert_equal(4, car.wheels)
9:    end
10:  end
```

- Line 1: loads all necessary files from `minitest` gem.
- Line 3: require file we are testing `car.rb` which contains the `Car` class. We use `require_relative` to specify the file name from the current file's directory. Now when we make references to the `Car` class, Ruby knows where to look for it. 
- Line 5: create test class. inherits from `Minitest::Test`. This enables our test class to inherit all necessary methods for writing tests. 

  - Within our test class `CarTest` we can write tests by creating an instance method that starts with `test_`. This is naming convention that tells Minitest that these methods are individual tests that need to be run. 

  - Within each test (or instance method that starts with `test_`) we will need to make some *assertions*. 

  - These assertions are what we are trying to verify. 

  - Before we make any assertions, we have to set up the appropriate data or objects to make assertions against. 

- Line 7: we first instantiate a `Car` object. We then use this `Car` object in our assertion to verify that the newly created `Car` objects indeed have 4 wheels. 

  - `assert_equal` is an inherited instance method. 
    - takes two parameters
      - expected value
      - test (actual) value
    - if there is a discrepancy, `assert_equal` will save the error and Minitest will report that error at the end of the test run. 

It's sometimes useful to have multiple assertions within one test, but in the beginning, we'll show one assertion within one test. 

---
---

## Reading test output 
If everything goes well, should see: 

```ruby 
1:  Run options: --seed 62238
2:  
3:  # Running:
4:  
5:  CarTest .
6:  
7:  Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.
8:  
9:  1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

Line 1: seed tells Minitest what order the tests were run in. The seed is how you tell Minitest to run the entire test suite in a particular order. (rarely used but can be useful in debugging)

Line 5: the `.` shows that the test was run and nothing went wrong. 
  - if you skip a test with the "skip" keyword, it'll say "S". If you have a failure, it will say "F".

--- 
---

## Failures 
Adding another test to make test fail.

```ruby 
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    car = Car.new
    assert_equal(3, car.wheels)
  end
end
```
Notice we added the test_bad_wheels test, and our assertion should fail. Let's run it and see.

```ruby 
1:  $ ruby car_test.rb
2:  
3:  Run options: --seed 8732
4:  
5:  # Running:
6:  
7:  CarTest F.
8:  
9:  Finished in 0.001222s, 1636.7965 runs/s, 1636.7965 assertions/s.
10:  
11:    1) Failure:
12:  CarTest#test_bad_wheels [car_test.rb:13]:
13:  Expected: 3
14:    Actual: 4
15:  
16:  2 runs, 2 assertions, 1 failures, 0 errors, 0 skips
```
Line 7: one test failed `F` and one passed `.`

--- 
---

## Skipping Tests 
