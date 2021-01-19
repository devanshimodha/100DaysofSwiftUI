import UIKit

/*
 # Day 8
 1. Creating your own structs
 2. Computed properties
 3. Property observers
 4. Methods
 5. Mutating methods
 6. Properties and methods of strings
 7. Properties and methods of arrays
 */

//Creating your own structs
struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"
print(tennis.name)

struct User {
    var name: String
    var age: Int
    var city: String
}
//Structs
func authenticate(_ user: User) {
    //...
}
func showProfile(for user: User) {
    //...
}
func signOut(_ user: User) {
    //...
}
//Tuples
func authenticate(_ user: (name: String, age: Int, city: String)) {
    //...
}
func showProfile(for user: (name: String, age: Int, city: String)) {
    //...
}
func signOut(_ user: (name: String, age: Int, city: String)) {
    //...
}


//Computed properties
//computed property – a property that runs code to figure out its value
struct computedSport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = computedSport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


//Property observers
struct Progress {
    var task: String
    var amount: Int
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
print(progress.amount)

struct ProgressSet {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progressSet = ProgressSet(task: "Loading data", amount: 0)
progressSet.amount = 30
progressSet.amount = 80
progressSet.amount = 100
print(progressSet.amount)


//Methods
//Functions inside structs are called methods, but they still use the same func keyword.
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())


//Mutating methods
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
print(person.name)
person.makeAnonymous()
print(person.name)


//Properties and methods of strings
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())


//Properties and methods of arrays
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
print(toys)

//If you want to check whether a string is empty, you should write this:
let myString = "Hello World!"
if myString.isEmpty {
    // code
}
//And not this:
if myString.count == 0 {
    // code
}
//Why using isEmpty is faster than checking count == 0
let name = "Guybrush Threepwood"
print(name[0])

extension String {
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

for i in stride(from: 0, to: name.count, by: 2) {
    print(name[i])
}

/*When we read the size of a string using count, Swift needs go through all the characters it has to figure out just how long the string is: it starts at the beginning, and counts through to the end. Reading the count of a string is an O(n) operation

In comparison, using isEmpty can return true or false after one simple check: does the start index of my string equal the end index of my string? If so, the string is empty and we’re done – there’s no need to count through all the characters.
*/
