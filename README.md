# domain-modeling-v2
INFO 498B - Project 5

## Notes:
* I added CustomStringConvertibleTests, DoubleExtensionTests, and MathematicsTests for the  Unit Tests for each part of the assignment.  
* I've labeled the V2 additions in my main.swift file.  The modifications should be at the top of the file or at the top of their respective class. 


## Assignment Spec:

###### Implement the CustomStringConvertible protocol on all types
* define a "description" property of type String
* this property should return a human-readable version of the contents
    * for example, Money should return "EUR22.0" (for amount 22.0 and currency EUR)
* Unit tests!

###### Define a new protocol: Mathematics
* mathematical operation methods (+, -)
* define it on Money
* write tests to verify that we can add and remove Money
* Unit tests!

###### Use an extension to extend Double
* add four new extension properties, USD, EUR, GBP, YEN
* each should return a Money
* each should convert the Double into a Money using "self" as the amount
* Unit tests!


#### Grading:
* 1 point for CustomStringConvertible on each domain class
* 1 point for Mathemtics and using it on Money
* 1 point for currency extensions on Double
* 2 points for unit tests
Note: for this and all future assignments, if your code does not compile, it is an automatic zero

