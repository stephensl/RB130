# Lesson 2.6: Testing Equality
---
---

- When we use `assert_equal` we are testing for *value equality*. 
- Invoking the `==` method
- If want strict object equality, use `assert_same`

For custom classes, we'll need to define a `==` method to override `BasicObject#==` if we are interested in testing for value equality. 

```ruby 
class Car 
  attr_accessor :wheels, :name

  def initialize
    @wheels = wheels 
  end 

  def ==(other)
    other.is_a?(Car) && name == other.name 
  end 
end 
```

## We can now call `assert_equal` on `Car` objects with expected behavior.

```ruby 
class CarTest < Minitest::Test 
  def test_value_equality 
    car1 = Car.new 
    car2 = Car.new 

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)   # this will pass
    assert_same(car1, car2)    # this will fail (comparing object id)
  end 
end 
```
---

Now that we told Ruby how to compare two Car objects, we can use assert_equal. Notice that assert_same is unaffected, because it's still looking at whether the two arguments are the same actual object.
---
---
---
---