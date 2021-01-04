import UIKit
/*
# Day 2
1. Arrays
2. Sets
3. Tuples
4. Arrays vs sets vs tuples
5. Dictionaries
6. Dictionary default values
7. Creating empty collections
8. Enumerations
9. Enum associated values
10. Enum raw values
11. Complex types: Summary
*/


/*
Arrays are collections of values that are stored as a single value.
We read values out of arrays using their numerical position, counting from 0.
This “counting from 0” has a technical term: we can say that Swift’s arrays are zero-based.
Swift will automatically crash your program if you attempt to read an array using an invalid index.
*/
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]


/*
Sets are collections of values just like arrays, except they have two differences:
1. Items aren’t stored in any order; they are stored in what is effectively a random order.
2. No item can appear twice in a set; all items must be unique.
 
Sets are unordered and cannot contain duplicates, whereas arrays retain their order and can contain duplicates.
 
Array: “An ordered, random-access collection.”
Set: “An unordered collection of unique elements.”
 
Go for an Array if:
 Order is important
 Duplicate elements should be possible
 Performance is not important
 
Go for a Set if:
 Order is not important
 Unique elements is a requirement
 Performance is important
*/
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])


/*
Tuples allow you to store several values together in a single value.
1. You can’t add or remove items from a tuple; they are fixed in size.
2. You can’t change the type of items in a tuple; they always have the same types they were created with.
3. You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
*/
var name = (first: "Taylor", last: "Swift")
name.0
name.first

//How are tuples different from arrays in Swift?
var website = (name: "Apple", url: "www.apple.com")
var websiteArray = ["Apple", "www.apple.com"]
var person = (name: "Paul", age: 40, isMarried: true)


let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
let set = Set(["aardvark", "astronaut", "azalea"])
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]


let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]


let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"]
favoriteIceCream["Charlotte", default: "Unknown"]


var teams = [String: String]()
teams["Paul"] = "Red"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
results = Array<Int>()


let result = "failure"
let result2 = "failed"
let result3 = "fail"
enum Result {
    case success
    case failure
}
let result4 = Result.failure



enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")


enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 2)


