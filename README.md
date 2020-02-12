# ruby-fractions
## Written for ENEE324 Assignment #1 Extra Credit by John Richards
A simple program to prove rationals countable by assigning each enumerated rational number with a unique natural number as a label.

## Theory / Sources
[Mathematical Basis for Program can be found HERE](https://math.stackexchange.com/a/1241178)

The program's basic functionality relies on a series of functions with an explicit bijection between the set of all natural numbers, **N**, to the set of all rational numbers, **Q**. The program utilizes this bijection to assign labels, and its inverse to generate a unique rational to the input label.

This program utilizes a recursive version of Stern's diatomic series to generate ordered natural numbers for use in enumerating the rationals. The actual functions used to provide the results can be seen in the **StackExchange** link above. 

## Usage
There are two main files to run the program, each with different functionality.

### driver.rb
The driver.rb file is run using the command `ruby driver.rb <mode> <inputs>`. There are two modes of operation for the driver, which are "rational" and "natural". 
The "rational" mode accepts two natural numbers as inputs (denoted by the `<inputs>` field above), and prints a unique natural label for the given rational. If invalid input is provided, the program will simply exit with an error message. 
The "natural" mode accepts a single natural number in the `<inputs>` field, and prints the corresponding rational number associated with that natural label. It will respond the same way if given invalid input.

**Example Usage:**
```
ruby driver.rb rational 3 4
```
or:
```
ruby driver.rb natural	4
```
### tester.rb
The tester.rb file is run using the command `ruby tester.rb <number>`. It will enumerate all rationals with the labels corresponding to the range [1,`<number>`] and print them to the console. This is all it does, and usage should be fairly straightforward.
**Example Usage:**
```
ruby tester.rb 1000
```
The given example command will print the first 1000 rationals with labels in the range `[1,1000]`.
