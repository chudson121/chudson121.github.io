---
layout: post
title: Interview Questions
---

## Non Tech
- Tell me about your career and about yourself. 
- What are you passionate about?
- What Technology did they use?
- What role did they play?
- 	How do they get things done? When did they take a leadership role and get it done?
- Tell me about the programming you do outside of work.
- Describe a recent experience/project that you found enjoyable and demanding?
- Was there a time, when you went that ‘extra mile' and beat all expectations?
- Describe a problem you discovered in your current job. How did you solve it?
- Describe a situation where you had to adapt and manage change but were having problems. What did you do?

## Technical
- Do you fix bugs before writing new code?
- 	What design patterns have you used (Dependency Injection, Façade and Factory)

- What are some of the access levels for variables/methods
	
		Public variables, are variables that are visible to all classes.
		Private variables, are variables that are visible only to the class to which they belong.
		Protected variables, are variables that are visible only to the class to which they belong, and any subclasses.
			Should a subclass be able to write this member? Then protected else private

- How is method overriding different from overloading? 

		Overloading is when you define two methods with the same name, in the same class, distinguished by their signatures.
		Overloading is resolved at compile time.
		Overriding is when you redefine a method that has already been defined in a parent class (using the exact same signature).
		Overriding is resolved at runtime (based on the type of the implicit first parameter).


- Can you inherit multiple interfaces?  

		yes

- What is the difference between const and static read-only? 

		If a variable needs to have a fixed value, that may not be changed across the application's life, then it may be declared with the const keyword. The value assigned to a constant variable (using the const keyword) must be known at the time of compilation 
		The const keyword may not be used with an object of reference type.
		In case a reference type needs to be assigned a non-changeable value, it may be set as readonly 

- What is an abstract class? 

		Abstract classes allow you to provide default functionality for the subclasses 
		The abstract modifier can be used with classes, methods, properties, indexers, and events.
		Use the abstract modifier in a class declaration to indicate that a class is intended only to be a base class of other classes. 
		An abstract class cannot be instantiated.
		An abstract class may contain abstract methods and accessors.

- What is the difference between an interface and abstract class? 
- 
		Interface							Abstract class
		Cannot implement methods			Can implement methods
		Can only inherit from another Interface	Can inherit from a class and one or more interfaces
		Cannot contain fields				Can contain fields
		Can contain property definitions	Can implement a property
		Cannot contain constructors or destructors	Can contain constructors or destructors
		Can be inherited from by structures	Cannot be inherited from by structures
		Can support multiple inheritance	Cannot support multiple inheritance

- When would you use an interface vs Abstract class?

		Abstract class answers “Is-A” 
		vs 
		Interface “Can-Do-this” 
		If multiple changes/added functionality use abstract class
		Provides common functionality to unrelated classes use interface (such as an analysis method for business rule engine)

## Coding projects
- PROJECT: Salary

		Alice is a manager of the sales team, her salary is 40000/year
		A sales associate Jon has a base salary of 30000/year and gets a 10% sales bonus at the end of the year.
		Design a system that lists employees and their pay for end of the year processing.
 
	- User Story 
	As a business analyst I would like to view all employees with their salaries and sales bonus with a total compensation.

	- Acceptance Criteria:
		Screen that lists employee’s in a row, with their salaries, bonuses, and total compensation (sum of salary and bonus).