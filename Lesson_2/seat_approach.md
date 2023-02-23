# Lesson 2.5: SEAT Approach 

## 4 steps to writing a test
  1. Set up the necessary objects
  2. Execute the code against the object we're testing
  3. Assert that the executed code did the right thing
  4. Tear down and clean up any lingering artifacts

---
---
---
Here is our basic `Car` class:
```ruby 
class Car 
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4 
  end 
end 
```


Here is our `CarTest` class: 
```ruby 
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
end
```

All these tests currently pass. 

There is however, some redundancy in the tests `car = Car.new`.

We can actually extract this to a `setup` instance method so it is run before each test. 

```ruby 
def setup 
  @car = Car.new 
end 
```

Our new `CarTest` class now looks like: 
```ruby 
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end
```
---
---

The setup method will be called before running each test, and the teardown method (which we don't have) will be called after running each test. In our case, we don't have any tear down activity, so it's not necessary. In some cases, we will need a tear down for cleaning up files or logging some information, or closing database connections.

In the simplest cases, we won't need either set up or tear down, but just keep in mind that there are 4 steps to running any test, and it is SEAT. At the minimum, you'll need EA, even if the E is just a simple object instantiation.