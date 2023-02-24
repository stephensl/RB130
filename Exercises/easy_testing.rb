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
