import UIKit
/*
# Day 1
1. Variables
2. Strings and integers
3. Multi-line strings
4. Doubles and booleans
5. String interpolation
6. Constants
7. Type annotations
8. Simple types: Summary */


//Create a variable and change it
//Swift automatically typecasts the variable accroding to the value
//They are called variables because they can vary – you can change their values freely.
var str = "Hello, playground" // str is a variable here
str = "Goodbye" //value of the variable can be changed

var favoriteShow = "Orange is the New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"


//Swift won’t let you typecast completely unrelated types
//Swift is a type-safe language, which means that every variable must be of one specific type.
//str = 38 -> error: Cannot assign value of type 'Int' to type 'String'
var age = 38
//Swift lets you use underscores as thousands separators – they don’t change the number, but they do make it easier to read.
var populationn = 8_000_000

var meaningOfLife = 42
//meaningOfLife = "Forty two" //error: cannot assign value of type 'String' to type 'Int'


//Multi-line strings: start and end with three double quote marks
var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""

var quote = "Change the world by being yourself"

var burns = """
The best laid schemes
O’ mice and men
Gang aft agley
"""


/*Doubles and booleans
“Double” is short for “double-precision floating-point number”, and it holds fractional values.

Whenever you create a variable with a fractional number, Swift automatically gives that variable the type Double

Doubles are integers can’t be mixed.

Booleans hold either true or false.
*/
var pi = 3.141
var awesome = true

var myInt = 1
var myDouble = 1.0


/*String interpolation - the ability to place variables inside your strings to make them more useful.

You can place any type of variable inside your string – all you have to do is write a backslash, \, followed by your variable name in parentheses.

String interpolation isn’t limited to placing variables – you can actually run code inside there.
 */
var score = 85
str = "Your score was \(score)"
var results = "The test results are here: \(str)"

var city = "Cardiff"
var message = "Welcome to \(city)!"


/*Constants
The let keyword creates constants, which are values that can be set once and never again.
 
If you try to change that, Xcode will refuse to run your code. It’s a form of safety: when you use constants you can no longer change something by accident.
 */
let taylor = "swift"


/*Type annotations
Type inference: It refers to the automatic detection of the data type of an expression
Swift assigns each variable and constant a type based on what value it’s given when it’s created.
*/
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

var percentage: Double = 99
var name: String


///Summary
/*
1. You make variables using var and constants using let. It’s preferable to use constants as often as possible.
2. Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.
3. Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
4. String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
5. Swift uses type inference to assign each variable or constant a type, but you can provide explicit types if you want.
*/
