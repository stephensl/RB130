# Lesson 2.7: Assignment: Write a test suite for TodoList
---
---

## `to_a` 
```ruby 
def test_to_a
  assert_equal(@todos, @list.to_a)
end 
```

## `size` 
```ruby 
def test_size 
  assert_equal(3, @list.size)
end 
```

## `first` 
```ruby 
def test_first 
  assert_equal(@todos[0], @list.first)
end 

# or 

def test_first 
  assert_equal(@todo1, @list.first)
end 
```

## `last` 
