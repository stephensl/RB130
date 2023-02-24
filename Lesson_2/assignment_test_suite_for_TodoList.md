# Lesson 2.7: Assignment: Write a test suite for TodoList
---
---
Ruby file is todolist_test.rb 
---
---

```ruby
require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end 
 
  def test_size 
    assert_equal(3, @list.size)
  end 

  def test_first 
    assert_equal(@todo1, @list.first)
  end 

  def test_last 
    assert_equal(@todo3, @list.last)
  end 

  def test_shift
    todo = @list.shift 
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end 

  def test_pop 
    todo = @list.pop 
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end 

  def test_done?
    assert_equal(false, @list.done?)
  end 
    
  def test_raise_error_if_not_todo_object
    str = String.new('hi')
    assert_raises(TypeError) { @list.add(str) }
    assert_raises(TypeError) { @list.add(5) }
    assert_raises(TypeError) { @list.add(['a']) }
    assert_raises(TypeError) { @list.add(Hash.new)}
  end 

  def test_shovel 
    new_todo = Todo.new("Test the method")
    @todos << new_todo 
    @list << new_todo 

    assert_equal(@todos, @list.to_a)
  end 

  def test_add_alias
    new_todo = Todo.new('Another test')
    @todos << new_todo
    @list.add(new_todo)

    assert_equal(@todos, @list.to_a)
  end 

  def test_item_at 
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(5) }
  end 
  
  def test_mark_done_at 
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert(@todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end 

  def test_mark_undone_at 
    assert_raises(IndexError) { @list.mark_undone_at(50) }
    @list.done!
    @list.mark_undone_at(0)
    refute(@todo1.done?)
  end 
 
  def test_done!
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    @list.done!
    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
    assert(@list.done?)
  end 

  def test_remove_at 
    assert_raises(IndexError) { @list.remove_at(10) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end 

  def test_to_s 
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end 
  
  def test_to_s_task_done 
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)

    assert_equal(output, @list.to_s)
  end 

  def test_to_s_all_tasks_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!

    assert_equal(output, @list.to_s)
  end 

  def test_each 
    result = []

    @list.each do |element|
      result << element 
    end 

    assert_equal([@todo1, @todo2, @todo3], result)
  end 

  def test_each_returns_original_collection 
    return_value = @list.each {|el| el }

    assert_equal(@list, return_value)
  end 

  def test_select_is_new_object 
    original_object_id = @list.object_id 

    selected = @list.select { |todo| true }

    refute(original_object_id == selected.object_id)
  end 

  def test_select_element_choice 
    @list.mark_done_at(0)
    return_value = @list.select { |todo| todo.done? }
    
    assert_equal([@todo1], return_value.todos)
  end 

end
```