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

print("You are \(age)")
print("Hi, I'm \(age).")
print("Today's date is \(Date()).")

/*
 1. Parameter in a function can be replaced with a closure that takes no parameter and returns back a value of the same type as the parameter.
 2. Such closure parameter can be marked with an @autoclosure attribute.
 */

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
    
    mutating func appendInterpolation(format value: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
    
    mutating func appendInterpolation(format value: Int, using style: NumberFormatter.Style) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
    
    mutating func appendInterpolation(_ value: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }
    
    mutating func appendInterpolation(twitter: String) {
        appendLiteral("<a href=\"https://twitter.com/\(twitter)\">@\(twitter)</a>")
    }
    
    mutating func appendInterpolation(_ values: [String], empty defaultValue: @autoclosure () -> String) {
        if values.count == 0 {
            appendLiteral(defaultValue())
        } else {
            appendLiteral(values.joined(separator: ", "))
        }
    }
    
    mutating func appendInterpolation(if condition: @autoclosure () -> Bool, _ literal: StringLiteralType) {
        guard condition() else { return }
        appendLiteral(literal)
    }
    
    mutating func appendInterpolation(_ person: Person) {
        appendLiteral("I'm a \(person.type) and I'm gonna \(person.action).")
    }
    
    mutating func appendInterpolation(_ person: Person, count: Int) {
        let action = String(repeating: "\(person.action) ", count: count)
        appendLiteral("\n\(person.type.capitalized)s gonna \(action)")
    }
    
//    mutating func appendInterpolation<T: Encodable>(debug value: T) {
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//
//        if let result = try? encoder.encode(value) {
//            let str = String(decoding: result, as: UTF8.self)
//            appendLiteral(str)
//        }
//    }
    
    mutating func appendInterpolation<T: Encodable>(debug value: T) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let result = try encoder.encode(value)
        let str = String(decoding: result, as: UTF8.self)
        appendLiteral(str)
    }
}

print("Hi, I'm \(age).")
print("Hi, I'm \(format: age).")
print("Hi, I'm \(format: age, using: .spellOut).")
print("Today's date is \(Date()).")
print("You should follow me on Twitter: \(twitter: "twostraws").")
let names = ["Malcolm", "Jayne", "Kaylee"]
print("Crew: \(names, empty: "No one").")

extension Array where Element == String {
    func formatted(empty defaultValue: @autoclosure () -> String) -> String {
        if count == 0 {
            return defaultValue()
        } else {
            return self.joined(separator: ", ")
        }
    }
}

print("Crew: \(names.formatted(empty: "No one")).")

let doesSwiftRock = true
print("Swift rocks: \(if: doesSwiftRock, "(*)")")
print("Swift rocks \(doesSwiftRock ? "(*)" : "")")

struct Person: Encodable {
    var type: String
    var action: String
}

let hater = Person(type: "hater", action: "hate")
print("Status check: \(hater)")
print(hater)
let player = Person(type: "player", action: "play")
let heartBreaker = Person(type: "heart-breaker", action: "break")
let faker = Person(type: "faker", action: "fake")

print("Let's sing: \(player, count: 5) \(hater, count: 5) \(heartBreaker, count: 5) \(faker, count: 5)")

//print("Here's some data: \(debug: faker)")
print(try "Status check: \(debug: hater)")

struct ColoredString: ExpressibleByStringInterpolation {
    // this nested struct is our scratch pad that assembles an attributed string from various interpolations
    struct StringInterpolation: StringInterpolationProtocol {
        // this is where we store the attributed string as we're building it
        var output = NSMutableAttributedString()

        // some default attribute to use for text
        var baseAttributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Georgia-Italic", size: 64) ?? .systemFont(ofSize: 64), .foregroundColor: UIColor.black]

        // this initializer is required, and can be used as a performance optimization
        init(literalCapacity: Int, interpolationCount: Int) { }

        // called when we need to append some raw text
        mutating func appendLiteral(_ literal: String) {
            // print it out so you can see how it's called at runtime
            print("Appending \(literal)")

            // give it our base styling
            let attributedString = NSAttributedString(string: literal, attributes: baseAttributes)

            // add it to our scratchpad string
            output.append(attributedString)
        }

        // called when we need to append a colored message to our string
        mutating func appendInterpolation(message: String, color: UIColor) {
            // print it out again
            print("Appending \(message)")

            // take a copy of our base attributes and apply the color
            var coloredAttributes = baseAttributes
            coloredAttributes[.foregroundColor] = color

            // wrap it in a new attributed string and add it to our scratchpad
            let attributedString = NSAttributedString(string: message, attributes: coloredAttributes)
            output.append(attributedString)
        }
    }

    // the final attributed string, once all interpolations have finished
    let value: NSAttributedString

    // create an instance from a literal string
    init(stringLiteral value: String) {
        self.value = NSAttributedString(string: value)
    }

    // create an instance from an interpolated string
    init(stringInterpolation: StringInterpolation) {
        self.value = stringInterpolation.output
    }
}

let strColor: ColoredString = "\(message: "Red", color: .red), \(message: "White", color: .white), \(message: "Blue", color: .blue)"

var interpolation = ColoredString.StringInterpolation(literalCapacity: 10, interpolationCount: 1)

interpolation.appendLiteral("Hello")
interpolation.appendInterpolation(message: "Hello", color: .red)
interpolation.appendLiteral("Hello")

let valentine = ColoredString(stringInterpolation: interpolation)


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
