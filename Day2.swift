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


//Remember: arrays keep the order and can have duplicates, sets are unordered and can’t have duplicates, and tuples have fixed values of fixed types inside them.
//If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
//If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
let set = Set(["aardvark", "astronaut", "azalea"])
//If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]


//Dictionaries are written in brackets with a colon between your identifier and value types
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
//These identifiers are called keys, and you can use them to read data back out of the dictionary:
heights["Taylor Swift"]



let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"]
favoriteIceCream["Charlotte", default: "Unknown"]

let examResults = [
    "english": 100,
    "french": 85,
    "geography": 75
]

let historyResult = examResults["history", default: 0]


//Arrays, sets, and dictionaries are called collections, because they collect values together in one place.
var teams = [String: String]()
teams["Paul"] = "Red"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
results = Array<Int>()


//Enumerations – usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.
let result = "failure"
let result2 = "failed"
let result3 = "fail"
enum ResultType {
    case success
    case failure
}
let result4 = ResultType.failure


// Enums with associated values let us add extra information to an enum case – think of them as being adjectives to a noun, because it lets us describe the thing in more detail.
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}

enum Weather2 {
    case sunny
    case lightBreeze
    case aBitWindy
    case quiteBlusteryNow
    case nowThatsAStrongWind
    case thisIsSeriousNow
    case itsAHurricane
}


enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 2)

enum Mood {
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}

enum MoodType: Int {
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}

enum AnimationCurve: Int {
    case easeInOut, easeIn, easeOut, linear
}

print(AnimationCurve.easeInOut.rawValue) // 0
print(AnimationCurve.easeIn.rawValue) // 1
print(AnimationCurve.easeOut.rawValue) // 2
print(AnimationCurve.linear.rawValue) // 3

enum TrackingEvent: String {
    case loggedIn = "logged_in"
}

func track(_ event: TrackingEvent) {
    print("Tracked \(event.rawValue)")
}

track(.loggedIn) // Tracked logged_in

//Iterating over an enum or getting the total amount of cases is easy by making use of the CaseIterable protocol. The protocol defines a property allCases which is a collection type.
enum SocialPlatform: String, CaseIterable {
    case twitter
    case facebook
    case instagram
}
//This makes it possible to use functional methods like forEach, filter, and map.
print(SocialPlatform.allCases) // twitter, facebook, instagram

//Enums and Equatable
let mostUsedPlatform = SocialPlatform.twitter

if mostUsedPlatform == .facebook {
    print("Fake news")
} else {
    print("You're totally right!")
}

//This does not work for enums with values. In that case, you have to inherit from the Equatable protocol.
enum TimeInterval: Equatable {
    case seconds(Int)
    case milliseconds(Int)
    case microseconds(Int)
    case nanoseconds(Int)
}

if TimeInterval.seconds(1) == .seconds(2) {
    print("Matching!")
} else {
    print("Not matching!")
}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

extension Result {
    /// The error in case the result was a failure
    public var error: Error? {
        guard case .failure(let error) = self else { return nil }
        return error
    }

    /// The value in case the result was a success result.
    public var value: Value? {
        guard case .success(let value) = self else { return nil }
        return value
    }
}

enum ImageType {
    case jpeg
    case png
    case gif
}

let imageTypeToDescribe = ImageType.gif

var description = "The image type \(imageTypeToDescribe) is"

//The fallthrough keyword causes program execution to continue from one case in a switch statement to the next case.
switch imageTypeToDescribe {
case .gif:
    description += " animatable, and also"
    fallthrough
default:
    description += " an image."
}

print(description) // The image type gif is animatable, and also an image.

///#Summary
/*
1. Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
2. Arrays store items in the order you add them, and you access them using numerical positions.
3. Sets store items without any order, so you can’t access them using numerical positions.
4. Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
5. Dictionaries store items according to a key, and you can read items using those keys.
6. Enums are a way of grouping related values so you can use them without spelling mistakes.
7. You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */
