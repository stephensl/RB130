# Lesson 1.11: Assignment `TodoList#select` method.
---

Let's continue using our TodoList and Todo classes, keeping in mind that our TodoList class should have a TodoList#each method.

In this assignment, you are to build a TodoList#select method, very similar to Array#select or the select method we built ourselves earlier. Take a look at the following code examples for how it should behave:

```ruby 
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect

# => [#<Todo:0x007fd88c0ad9f0 @title="Buy milk", @description="", @done=true>]

# That's an array which contains all done todos from list. In this case, there's only 1 todo that's done, so there's only one element in the array.
```

---
---
---

## My implementation of `TodoList#select` 

```ruby 
  def select 
    selected = []
    
    each do |todo|             # implicit self calling TodoList#each
      selected << todo if yield(todo)
    end 

    selected
  end 

  # => [#<Todo:0x00000179fa622cb0 @title="Buy milk", @description="", @done=true>]
  ```

  ### The above code returns an Array object. It doesn't seem to follow the pattern from the Ruby core library of returning an object of the calling class. In other words, the TodoList#select method should return a TodoList object.
---
---
---
Your next task is to refine our TodoList#select method so that it still behaves the same, except instead of returning an Array object, it returns a TodoList object.

---
---
```ruby 
  def select 
    list = TodoList.new(title)   # title getter method of calling object
    
    each do |todo|
      list << todo if yield(todo)
    end 

    list
  end 
end 
```
---
---
One final refinement we should make is to a previous method: TodoList#each. Notice that it, too, doesn't follow the pattern. One quirk with Array#each and Hash#each is that it returns the original object.

Update the TodoList#each method so that it returns the original (not new) TodoList object.

```ruby 
  def each
    0.upto(todos.size - 1) do |index|
      yield(todos[index])
    end 

    self
  end 
  ```