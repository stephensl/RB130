# Question: 

# Boolean Assertions

# Write a minitest assertion that will fail if the value.odd? is not true.

#
#

# Answer: 

assert(value.odd?, 'value is not odd')

# or 

assert_equal(true, value.odd?)

---
---

# Question 

# Equality Assertions

# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

#
#

# Answer: 

assert_equal('xyz', value.downcase)

# or 

assert(value.downcase == 'xyz')

---
---

# Question: 

# Nil Assertions

# Write a minitest assertion that will fail if value is not nil.

#
#

# Answer: 

assert_nil(value)

---
---

# Question: 

# Empty Object Assertions

# Write a minitest assertion that will fail if the Array list is not empty.

#

#

# Answer: 
 
assert_empty(list)  # preferred

# or 

assert_equal(true, list.empty?)

---
---

# Question 

# Included Object Assertions

# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.


#
#

# Answer: 

assert_include(list, 'xyz')   # assert_include: first arg contains second arg

# or 

assert_equal(true, list.include?('xyz'))

---
---

# Question: 

# Exception Assertions

# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

#
#

# Answer: 

assert_raises(NoExperienceError) { employee.hire } 

# does block raise exception of the named type. 

---
---

