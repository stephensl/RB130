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


