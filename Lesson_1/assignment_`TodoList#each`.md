# Lesson 1.9: `TodoList#each` method 
---

Given our final Todo and TodoList classes from the previous assignment, implement a TodoList#each method. 

This method should behave similarly to the familiar Array#each, and the each method we built ourselves in an earlier example. 

The TodoList#each should take a block, and yield each Todo object to the block. Here's an example of how to use it:


```ruby 
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done 

  def initialize(title, description='')
    @title = title 
    @description = description
    @done = false 
  end 

  def done!
    self.done = true 
  end 

  def done?
    done 
  end 

  def undone!
    self.done = false 
  end 

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end 

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done 
  end 
end 

###

class TodoList 
  attr_accessor :title
  attr_reader :todos

  def initialize(title)
    @title = title 
    @todos = []
  end 

  def <<(task)
    raise TypeError, "can only add Todo objects" unless task.instance_of?(Todo)

    todos << task 
  end 
  alias_method :add, :<<

  def size 
    todos.size 
  end 

  def first 
    todos.first 
  end 

  def last 
    todos.last 
  end 

  def to_a 
    todos.clone 
  end

  def done?
    todos.all? { |todo| todo.done? }
  end 

  def item_at(index)
    todos.fetch(index)
  end 

  def mark_done_at(index)
    item_at(index).done!
  end 

  def mark_undone_at(index)
    item_at(index).undone!
  end 

  def done! 
    todos.map(&:done!)
  end 

  def shift 
    todos.shift 
  end 

  def pop 
    todos.pop
  end 

  def remove_at(index)
    todos.delete(item_at(index))
  end 

  def to_s
    text = "----#{title}----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end 
end 

# Example: 

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")
```
```ruby
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end
```

