# Assert Yourself: A Detailed Minitest Tutorial 
https://launchschool.medium.com/assert-yourself-a-detailed-minitest-tutorial-f186acf50960

---
---

## Definitions 

- Testing framework:
  - software that provides a way to test each component of an application. 
  - can test methods or entire programs
  - framework should be able to: 
    - provide appropriate inputs
    - check return values 
    - examine outputs
    - determine if errors occur when they should 

- Testing framework features:
  - a way to describe the tests you want to run 
  - a way to execute the tests 
  - a way to report the results of those tests

- Testing hierarchy 
  - test step or test 
    - most basic level of testing 
    - verifies certain expectation has been satisfied
    - test steps employ an assertion or an expectation
  - test case
    - set of actions that need to be tested combined with appropriate test steps
    - typically only one test step is used per test case
  - test suite 
    - collection of one or more test cases that, taken together, demonstrate whether a particular application facet is operating correctly. 
    - loosely used term as a test suite can test an entire class, a subset of the class, or a combination of classes, all the way up to the complete application.
    - test suite may be entirely in one file or spread among several files. 

---
---

## Writing a simple test suite 

- Test suites are typically stored in a special `tests` directory beneath your main application's development directory. 
  - example: /Users/me/todo (application)
             /Users/me/todo/tests (test directory path)
  - common convention in naming test suite
    - example: for a class name `ToDo` test suite called `to_do_test.rb` or `t_to_do.rb`.

---

### Scaffolding 
```ruby 
# package everything need to run most basic tests and that all of the tests in the test suite will be run automatically when the test suite is run.

require 'minitest/autorun' 

# require the file containing the code we want to test
#  the relative name of the module with respect to the test suite file.

require_relative '../lib/zyzzy'  

# Minitest runs tests in every class that inherits from Minitest::Test

class XyzzyTest < Minitest::Test      
  
  # scaffolding for two example test cases

  def test_the_answer_is_42
    xyzzy = Xyzzy.new 
    assert(xyzzy.the_answer == 42, "the answer did not return 42")
  end 

  def test_whats_up_returns_doc 
    xyzzy = Xyzzy.new 
    assert(xyzzy.whats_up == "Doc", "whats_up did not return 'Doc'")
  end 
end 
```
- ###  Each of these tests succeeds if the specified condition is true. If the condition is false, the test fails, and the message string specified as the second argument is printed as part of the failure message.

- ### Each of the test cases is represented by a method whose name begins with `test_`. 
  - Minitest looks for and runs all methods in the test suite whose name begins with `test_`. 
  - The rest of the method name is usually a short description of what we are testing.

- Some test suites may have multiple test suite classes
  - Minitest will run all of the test suite classes defined in the file. 

---
---
---

## Writing Tests
Ideally the test cases should be run before writing any code. This is frequently known as *Test Driven Development* 

TDD follows a simple pattern:
  - Create a test that fails 
  - Write just enough code to implement the change or new feature
  - Refactor and improve, then repeat tests
- This is often called *Red-Green-Refactor* 
- It is useful to use the TDD approach in developing tests at the lowest levels.

---
### Example: 

Suppose we want to develop a method to calculate square roots rounded to the nearest integer. If we attempt to take the square root of a negative number, the method should return `nil`.

For brevity, we will write our square_root method in the same file as our tests -- this is not usually good practice.

First Test Case: square_root(9) should return 3

For our first test, we will take a simple case — most people know that the square root of 9 is 3, so let’s test that.

```ruby 
1:  require 'minitest/autorun'
2:  
3:  def square_root(value)
4:  
5:  end 
6:  
7:  class SquareRootTest < Minitest::Test
8:    def test_that_square_root_of_9_is_3
9:      result = square_root(9)
10:      assert_equal(3, result)
11:    end 
12:  end 

# We have also supplied a dummy square_root method just so the test case has something it can test. Note that we used the name square_root because our test case uses that name -- the test case is already driving our development by describing the interface we want to use.

# Outputs 

$ ruby sandbox.rb
Run options: --seed 27835

# Running:

F

Finished in 0.010183s, 98.1990 runs/s, 98.1990 assertions/s.

  1) Failure:
SquareRootTest#test_that_square_root_of_9_is_3 [sandbox.rb:10]:
Expected: 3
  Actual: nil

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```

- Failure occurs on line 10, when `assert_equal` is called.

### Now that we have something that fails, let's fix it: 
```ruby 
1:  require 'minitest/autorun'
2:  
3:  def square_root(value)
4:    Math.sqrt(value)
5:  end 
6:  
7:  class SquareRootTest < Minitest::Test
8:    def test_that_square_root_of_9_is_3
9:      result = square_root(9)
10:      assert_equal(3, result)
11:    end 
12:  end 

# outputs 

$ ruby sandbox.rb
Run options: --seed 5319

# Running:

. # passed

Finished in 0.014664s, 68.1924 runs/s, 68.1924 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

The period `.` shows that this test case passed. Other possible output here could be: 
  - `F` : test(s) failed
  - `E` : one or more test cases broken 
  - `S` : test case was skipped

---
---
---

## Second Test Case: square_root(17) should return 4
- Our goal is to round the square root to the nearest integer, so the square_root of 17 should be rounded to 4. Lets write that test case and test it:

```ruby 
require 'minitest/autorun'

def square_root(value)
  Math.sqrt(value)
end 

class SquareRootTest < Minitest::Test
  def test_that_square_root_of_9_is_3
    result - square_root(9)
    assert_equal(3, result)
  end 

  def test_that_square_root_of_17_is_4 
    result = square_root(17)
    assert_equal(4, result)
  end 
end 

# Output 

$ ruby sandbox.rb
Run options: --seed 109

# Running:

.F

Finished in 0.015913s, 125.6795 runs/s, 125.6795 assertions/s.

  1) Failure:
SquareRootTest#test_that_square_root_of_17_is_4 [sandbox.rb:15]:
Expected: 4
  Actual: 4.123105625617661

2 runs, 2 assertions, 1 failures, 0 errors, 0 skips
```

We get our expected failure.. the problem is we are not rounding the result but are returning a `Float` value that closely approximates the square root of 17. 

To fix it, we simply update our `square_root` method to round to nearest integer.

```ruby 
def square_root(value)
  Math.sqrt(value).round
end 
```
Now both tests pass. 

---
---
---

## Test Case: `square_root(-1)` should return `nil`. 

In the real domain, square roots aren’t defined for negative numbers, and our requirements require that #square_root should return nil if it is passed a negative number. Once again, let's write a test case, this time using #assert_nil:

```ruby 
require 'minitest/autorun'

def square_root(value)
  return nil if value.negative? 
  
  Math.sqrt(value).round 
end 

class SquareRootTest < Minitest::Test 
  def test_square_of_negative_nil 
    result = square_root(-1)
    assert_nil(result)
  end 
end 
```

---
---


## Test Sequence 
Minitest varies in the order in which it runs the tests. This is done randomly and tests should not be order dependent. 

If there is an issue that arises only when the tests are run in a particular order, you can use `--seed` option to run tests in a known order. 

For example: 

Suppose you run some tests and get the following output:
```ruby 
Run options: --seed 51859
...
  1) Failure:
XxxxxTest#test_... [x.rb:9]:
Expected: 3
  Actual: nil
3 runs, 3 assertions, 1 failures, 0 errors, 0 skips
```

but a subsequent run produces:
```ruby 
Run options: --seed 23783
...
3 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```

### You can use the first set of tests by using `--seed 51859` on the command: 

`ruby tests/tests.rb --seed 51859`

---
If you absolutely, positively need to always execute things in order, you must name all your test methods in alphabetical order, and include the command:

`i_suck_and_my_tests_are_order_dependent!`

As you might surmise, the developers of Minitest feel very strongly about this. Don’t do it!

---
---
---

## Simple Assertions
Each assertion is a call to a method whose name begins with `assert`. Assertions check whether the condition is true; refutations test whether the given condition is false 

---
---
## assert 
- Tests whether the first argument is "truthy"
- Typically used for methods that return `true` or `false`.

```ruby 
assert(reverse('abc') == 'cba')

# => true depending on reverse method..

assert(reverse('abc') == 'cba', "reverse('abc') did not return 'cba'")

#  if false
  # => "reverse('abc') did not return 'cba'"
```

---
---

# assert_equal 
  - Most frequently used assertion
  - Tests whether an actual value produced during a test is equal to expected value.
  - Uses `==` to perform comparisons
    - May use custom `==` or inherited `BasicObject#==` 

Example:
```ruby 
assert_equal('cba', reverse('abc'))
```
The first argument represents an expected value, while the second argument is the actual value. In this case, the actual value is return value of `reverse('abc')`.

---
---

## assert_in_delta
  - Helpful in dealing with `Float` numbers. 
  - Tests if floating point number is *near* some value
    - We set parameters of "how near"

```ruby 
assert_in_delta(3.1415, Math::PI, .0001)
assert_in_delta(3.1415, Math::PI, .00001)
```
In these two tests, the 3rd argument is the "delta" value..if the expected and actual answers differ by more than the delta value, the assertion fails. 

  * If a third argument is not supplied, a delta value of `0.001` is default. 

In this example, the first test succeeds because 3.1415 differs from the actual value returned by Math::PI (3.141592653589793) by less than 0.0001 (the actual difference is approximately 0.0000027), while the second test fails because 3.1415 differs from Math::PI by more than 0.00001.

---
---

## assert_same 
  - Tests whether two object arguments are the same object. 
  - Useful in determining if method returns same object passed in or not. 
  - Uses the `equal?` method to compare objects

`assert_same(ary, ary.sort!)` 

This would pass as we perform a mutation on the same object. 

---
---

## assert_nil 
  - Checks whether object is `nil`

  `assert_nil(find_todo_list('Groceries'))`

---
---

## assert_empty
  - checks whether an object returns true when `empty?` is called on it. 
  - if object does not respond to `empty?` or returns a value other than `true`, the test fails. 
  - Most useful for collections and strings

```ruby 
list = []
assert_empty(list)

# => Pass
```

---
---

## assert_includes 
  - checks whether collection includes a specific object 
  - fails if object doesn't respond to `include?` or method returns value other than `true`.

```ruby 
list = %w(abc def xyz)
assert_includes(list, 'xyz')
```

---
---


## assert_match 
  - working with Strings 
  - Uses regex to see if string matches pattern
  - Most often used with text whose content only needs a few specific words. 

`assert_match(/not found/, error_message)`

---
---

## Set up/tear down
  - code that needs to be run before or after each test. 
  - `setup` method called prior to each test case in the class.
  - `teardown` called after each test. 

## Commonly set instance variables in `setup` method that can be used in the actual test case methods.

```ruby 
require 'minitest/autorun'
require 'pg'

class MyApp
  def initialize
    @db = PG.connect 'mydb'
  end
  
  def cleanup
    @db.finish
  end
  
  def count; ...; end
  
  def create(value); ...; end
end

class DatabaseTest < Minitest::Test
  def setup
    @myapp = MyApp.new
  end

  def test_that_query_on_empty_database_returns_nothing
    assert_equal 0, @myapp.count
  end

  def test_that_query_on_non_empty_database_returns_right_count
    @myapp.create('Abc')
    @myapp.create('Def')
    @myapp.create('Ghi')
    assert_equal 3, @myapp.count
  end


  def teardown
    @myapp.cleanup
  end
end
```
This test suite runs two test cases. Prior to each test case, #setup creates a @myapp instance variable that references a MyApp object. After each test case, #teardown calls @myapp.cleanup to perform any shutdown cleanup required by the MyApp class. In this example, set up and tear down consist of code that establishes and then drops a database connection. Elsewhere in the test suite, we can reference @myapp freely to access the object.

Note that both #setup and #teardown are independent and optional; you can have both, neither, or either one in any test suite.

---
---

## Testing Error Handling: `assert_raises` 
  - testing exceptions 

```ruby 
def test_with_negative_number 
  assert_raises(Math::DomainError) { square_root(-3) }
end 
```
In this case `assert_raises` asserts that the associated block should raise a `Math::DomainError` exception, or an exception that is a subclass of `Math::DomainError`. 

If no exception is raised or a different exception is raised, the test fails. 

---
---

## Testing Output 
Many tests require that you examine the terminal output of your application.

## assert_silent 

