# Lesson 1.16: Summary 
Generally getting comfortable with the idea of blocks and closures as unnamed *chunks of code* that can be passed around to execute later.

- Blocks are one way Ruby implements closures as well as lambdas and `Procs`. 
- Closures drag their surrounding context/environment around, known as its **binding** and is at the core of how variable scope works.
- Blocks are useful for pushing decisions to method invocation time.
- Blocks are great for sandwiching code by wrapping logic to perform some before/after actions.
- We can write methods that take a block with the `yield` keyword.
- When we `yield` we can also pass arguments to the block. 
- When we `yield` we must be aware of block's return value.
- Blocks are crucial in re-implementing many of the common core-library methods in our own classes.
- The `Symbol#to_proc` is a nice shortcut when working with collections.
- How to return a chunk of code from a method or block. 

---
---
