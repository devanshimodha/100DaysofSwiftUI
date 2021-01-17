import UIKit

/*
 # Day 12
 1. Handling missing data
 2. Unwrapping optionals
 3. Unwrapping with guard
 4. Force unwrapping
 5. Implicitly unwrapped optionals
 6. Nil coalescing
 7. Optional chaining
 8. Optional try
 9. Failable initializers
 10. Typecasting
 */


//Handling missing data
var age: Int? = nil
age = 38


//Unwrapping optionals
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}


//Unwrapping with guard
//Use if let if you just want to unwrap some optionals, but prefer guard let if you’re specifically checking that conditions are correct before continuing.
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

greet(nil)
greet("Taylor")

func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}
printMeaningOfLife()

func printMeaningOfLifeGuard() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}
printMeaningOfLifeGuard()


//Force unwrapping (! - crash operator)
let str = "5"
let num = Int(str)
print(num)
let numForceOp = Int(str)!
print(numForceOp)

let url = URL(string: "https://www.apple.com")!
let website = "test"
let url2 = URL(string: "https://www.\(website)")!

let randomNumber = (1...10).randomElement()!
print(randomNumber)

var items = [Int]()

func isLuckyNumber(_ num: Int = 0) -> Bool {
    return (num == 2) ? true : false
}

for i in 1...10 {
    if isLuckyNumber(i) {
        items.append(i)
    }
}
print(items)
let randomNumber2 = items.randomElement()!
print(randomNumber2)

enum Direction: CaseIterable {
    case north, south, east, west
    
    static func random() -> Direction {
        Direction.allCases.randomElement()!
    }
}

let randomDirection = Direction.allCases.randomElement()!
print(randomDirection)
let randomDirection2 = Direction.random()
print(randomDirection2)


//Implicitly unwrapped optionals
//Implicitly unwrapped optionals don’t need to be unwrapped to be used. Swift won’t make you use if let or similar like it would with regular optionals.
let age2: Int! = nil


//Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"

let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0
let crusherScore2 = scores["Crusher", default: 0]


//Optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

let names2 = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names2["Vincent"]?.first?.uppercased() ?? "?"

class DriversLicence {
    var pointsOnLicence = 0

    func isValidForVehicle(vehicle : Vehicle) -> Bool {
        // ...
        return true
    }
}

class Vehicle {
    var owner: Person?
}

class Person {
    var licence : DriversLicence?
}

let andy = Person()

//Optional Binding
if let licence = andy.licence {
    print("Andy has \(licence.pointsOnLicence) points on his license")
} else {
    print("Andy doesn't have a drivers license")
}

//Optional Chaining
let pointsOnLicence = andy.licence?.pointsOnLicence
if let points = pointsOnLicence {
    print("Andy has \(points) points on his licence")
} else {
    print("Andy doesn't have a drivers licence")
}

var points = 3
andy.licence?.pointsOnLicence = points
andy.licence = DriversLicence()

if let _ = andy.licence?.pointsOnLicence += points {
    print("Andy now has \(andy.licence!.pointsOnLicence) points on his licence.")
}

var catalogue = ["Honda" : (minPrice:10, maxPrice:100)]
var honda = catalogue["Honda"]

if let price = catalogue["Honda"]?.minPrice {
    print("The minimum price is \(price)")
}

if let _ = catalogue["Honda"]?.maxPrice = 30 {
    print(catalogue)
}

var otherCatalogue : Dictionary? = ["Lotus" : (minPrice: 50, maxPrice: 200)]
var lotus = otherCatalogue?["Lotus"]

if let price = otherCatalogue?["Lotus"]?.minPrice {
    print("The minimum price is \(price)")
}

let car = Vehicle()
car.owner = andy

if let canDriveVehicle = andy.licence?.isValidForVehicle(vehicle: car) {
    if (canDriveVehicle) {
        print("Andy's licence allows him to drive the car.")
    } else {
        print("Andy's license doesn't allow him to drive the car.")
    }
} else {
    print("Andy doesn't have a licence.")
}

if let points = car.owner?.licence?.pointsOnLicence {
    print("The car's owner has \(points) points on their licence.")
}

if let canDriveVehicle2 = car.owner?.licence?.isValidForVehicle(vehicle: car) {
    if (canDriveVehicle2) {
        print("The owner of the car has a licence that allows them to drive it.")
    } else {
        print("The owner of the car doesn't have a licence that allows them to drive it.")
    }
} else {
    print("The car either doesn't have an owner or the owner doesn't have a drivers licence.")
}


//Optional try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")


//Failable initializers: an initializer that might work or might not.
struct Person2 {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

struct Employee {
    var username: String
    var password: String

    init?(username: String, password: String) {
        guard password.count >= 8 else { return nil }
        guard password.lowercased() != "password" else { return nil }

        self.username = username
        self.password = password
    }
}

let tim = Employee(username: "TimC", password: "app1e")
let craig = Employee(username: "CraigF", password: "ha1rf0rce0ne")


//Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

class Person3 {
    var name = "Anonymous"
}

class Customer: Person3 {
    var id = 12345
}

class Employee2: Person3 {
    var salary = 50_000
}

let customer = Customer()
let employee = Employee2()
let people = [customer, employee]

for person in people {
    if let customer = person as? Customer {
        print("I'm a customer, with id \(customer.id)")
    } else if let employee = person as? Employee2 {
        print("I'm an employee, earning $\(employee.salary)")
    }
}

///#Summary
/*
 1. Optionals let us represent the absence of a value in a clear and unambiguous way.
 2. Swift won’t let us use optionals without unwrapping them, either using if let or using guard let.
 3. You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash.
 4. Implicitly unwrapped optionals don’t have the safety checks of regular optionals.
 5. You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside.
 6. Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
 7. You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
 8. If you need your initializer to fail when it’s given bad input, use init?() to make a failable initializer.
 9. You can use typecasting to convert one type of object to another.
 */

