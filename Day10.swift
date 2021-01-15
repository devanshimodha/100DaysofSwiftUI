import UIKit

/*
 # Day 10
 1. Creating your own classes
 2. Class inheritance
 3. Overriding methods
 4. Final classes
 5. Copying objects
 6. Deinitializers
 7. Mutability
 */

//Creating your own classes
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")


//Class inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
}

let poodle = Poodle(name: "Barky")


//Overriding methods
poodle.makeNoise()


//Final classes
//When you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.
final class Cow {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//class Gyr: Cow { // Inheritance from a final class 'Cow'
//    init(name: String) {
//        super.init(name: name, breed: "Gyr")
//    }
//}


//Copying objects
//When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)

struct SingerStruct {
    var name = "Taylor Swift"
}
var singerStruct = Singer()
print(singerStruct.name)

var singerStructCopy = singer
singerStructCopy.name = "Justin Bieber"

print(singerStruct.name)

var message = "Welcome"
var greeting = message
greeting = "Hello"

var a = 42
var b = a
b += 1

struct Point {
    var x: Int
    var y: Int
}

let origin = Point(x: 0, y: 0)
//origin.x = 10 // error

var otherPoint = Point(x: 0, y: 0)
otherPoint.x += 10
print("x: \(otherPoint.x) y: \(otherPoint.y)")

var thirdPoint = origin
thirdPoint.x += 10
print("x: \(thirdPoint.x) y: \(thirdPoint.y)")
print("x: \(origin.x) y: \(origin.y)")

extension Point {
    static let origin = Point(x: 0, y: 0)
}
Point.origin

struct Size {
    var width: Int
    var height: Int
}

struct Rectangle {
    var origin: Point
    var size: Size
}

Rectangle(origin: Point.origin, size: Size(width: 320, height: 480))

extension Rectangle {
    init(x: Int = 0, y: Int = 0, width: Int, height: Int) {
        origin = Point(x: x, y: y)
        size = Size(width: width, height: height)
    }
}

var screen = Rectangle(width: 320, height: 480) {
    didSet {
        print("Screen changed! \(screen)")
    }
}
screen.origin.x = 10

func +(lhs: Point, rhs: Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}
print("x: \(screen.origin.x), y: \(screen.origin.y)")
screen.origin + Point(x: 10, y: 10)
print("x: \(screen.origin.x), y: \(screen.origin.y)")

extension Rectangle {
    mutating func translate(by offset: Point) {
        origin = origin + offset
    }
}
screen.translate(by: Point(x: 10, y: 10))
print("x: \(screen.origin.x), y: \(screen.origin.y)")

//let otherScreen = screen
//otherScreen.translate(by: Point(x: 10, y: 10)) // error

//let point = Point.origin
//// doesn't work, because the setter is mutating.
//point.x = 10

//The names sort and sorted are not chosen at random, but are names that conform to the Swift API Design Guidelines. Likewise, we applied these guidelines to translate and translated. There is even specific documentation for methods that have a mutating and a non-mutating variant: because translate has a side-effect, it should read as an imperative verb phrase. The non-mutating variant should have a -ed or -ing suffix.
extension Rectangle {
    func translated(by offset: Point) -> Rectangle {
        var copy = self
        copy.translate(by: offset)
        return copy
    }
}
screen.translated(by: Point(x: 20, y: 20))
print("x: \(screen.origin.x), y: \(screen.origin.y)")

func moveByTenTen(rectangle: Rectangle) -> Rectangle {
    var changed = rectangle
    changed.translate(by: Point(x: 10, y: 10))
    return changed
}
screen = moveByTenTen(rectangle: screen)
print("x: \(screen.origin.x), y: \(screen.origin.y)")

func moveByTwentyTwenty(rectangle: inout Rectangle) {
    rectangle.translate(by: Point(x: 20, y: 20))
}
moveByTwentyTwenty(rectangle: &screen)

//let immutableScreen = screen
//moveByTwentyTwenty(rectangle: &immutableScreen) // error

func +=(lhs: inout Point, rhs: Point) {
    lhs = lhs + rhs
}
var myPoint = Point.origin
myPoint += Point(x: 10, y: 10)

var array = [Point(x: 0, y: 0), Point(x: 10, y: 10)]
array[0] += Point(x: 100, y: 100)


//Deinitializers
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


//Mutability
/*:
- Variable classes can have variable properties changed
- Constant classes can have variable properties changed
- Variable structs can have variable properties changed
- Constant structs cannot have variable properties changed
*/
let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)


///#Summary
/*
 1. Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 2. One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
 3. You can mark a class with the final keyword, which stops other classes from inheriting from it.
 4. Method overriding lets a child class replace a method in its parent class with a new implementation.
 5. When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
 6. Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
 7. Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
 */

