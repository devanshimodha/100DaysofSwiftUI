import UIKit

/*
 # Day 11
 1. Protocols
 2. Protocol inheritance
 3. Extensions
 4. Protocol extensions
 5. Protocol-oriented programming
 */


//Protocols
//Protocols let us create blueprints of how our types share functionality, then use those blueprints in our functions to let them work on a wider variety of data.
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

displayID(thing: User(id: "21"))

struct Book {
    var name: String
}

func buy(_ book: Book) {
    print("I'm buying \(book.name)")
}

protocol Purchaseable {
    var name: String { get set }
}

struct BookPro: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buyPro(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

buyPro(BookPro.init(name: "Great Expectations", author: "Charles Dickens"))


//Protocol inheritance
//Using protocol inheritance lets us share definitions and reduce duplication, which is a great way to build up functionality piece by piece.
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

protocol Computer {
    var price: Double { get set }
    var weight: Int { get set }
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}

protocol Laptop {
    var price: Double { get set }
    var weight: Int { get set }
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
    var screenSize: Int { get set }
}

protocol Product {
    var price: Double { get set }
    var weight: Int { get set }
}

protocol ComputerPro: Product {
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}

protocol LaptopPro: Computer {
    var screenSize: Int { get set }
}


//Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

number.isEven


//Protocol extensions
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }
print(allEven)

let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }
print(allEven2)

let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }
print(allEven3)


//Protocol-oriented programming
protocol Identifiable2 {
    var id: String { get set }
    func identify()
}

//Protocol extensions allow us to provide a default:
extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identify()

///#Summary
/*
 1. Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
 2. You can build protocols on top of other protocols, similar to classes.
 3. Extensions let you add methods and computed properties to specific types such as Int.
 4. Protocol extensions let you add methods and computed properties to protocols.
 5. Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
 */

