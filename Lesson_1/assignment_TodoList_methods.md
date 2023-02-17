# Lesson 1.12: Assignment TodoList methods
---
---
## We now want to add a few more methods that can piggy-back off of the `TodoList#each` and `TodoList#select` methods. 
#
Implement the below methods.


- `find_by_title`
  -	takes a string as argument, and returns the first `Todo` object that matches the argument. Return `nil` if no `todo` is found.

  ```ruby 
  def find_by_title(str)
    each do |todo|
      return todo if todo.title.downcase == str.downcase
    end 
  
    nil 
  end

  # or 

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end 
  ```
  ---


- `all_done`	
  - returns new `TodoList` object containing only the done items

  ```ruby 
  def all_done 
    select do |todo|
      todo.done? 
    end 
  end 
  ```
  ---

- `all_not_done`	
  - returns new `TodoList` object containing only the not done items

  ```ruby 
  def all_not_done
    select do |todo|
      todo.done? == false 
    end 
  end 
  ```
  ---

- `mark_done`	
  - takes a string as argument, and marks the first `Todo` object that matches the argument as done.\

  ```ruby 
  def mark_done(str)
    todo = find_by_title(str)
    todo.done!
  end 
  ```
  ---

- `mark_all_done`	
  - mark every `todo` as done

  ```ruby 
  def mark_all_done 
    each do |todo|
      todo.done!
    end 
  end 
  ```
  ---


- `mark_all_undone`	
  - mark every `todo` as not done

  ```ruby 
  def mark_all_undone
    each do |todo|
      todo.undone!
    end 
  end 
  ```
---
---
---

