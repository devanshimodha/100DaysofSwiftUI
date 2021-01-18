import UIKit

/*
 # Day 13
 1. Variables and constants
 2. Types of Data
 3. Operators
 4. String interpolation
 5. Arrays
 6. Dictionaries
 7. Conditional statements
 8. Loops
 9. Switch case
 */


//Variables and constants
var name = "Tim McGraw"
name = "Romeo"

//let name2 = "Tim McGraw" //Cannot assign to value: 'name2' is a 'let' constant
//name2 = "Romeo"

//var name = "Tim McGraw" //Invalid redeclartion of 'name'


//Types of Data
var nameStr: String
nameStr = "Tim McGraw"

var age: Int
age = 25

//name = 25 //cannot assign value of type 'Int' to type 'String'
//age = "Tim McGraw" //cannot assign value of type 'String' to type 'Int'

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

var longitude2: Double
longitude2 = -86.783333
longitude2 = -186.783333
longitude2 = -1286.783333
longitude2 = -12386.783333
longitude2 = -123486.783333
longitude2 = -1234586.783333
longitude2 = 123456789.123456789

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false

//There are two ways to tell Swift what type of data a variable holds: assign a value when you create the variable, or use a type annotation. If you have a choice, the first is always preferable because it's clearer.
var name2 = "Tim McGraw" //preferred

var name3: String
name3 = "Tim McGraw"

//This technique is called type inference, because Swift can infer what data type should be used for a variable by looking at the type of data you want to put in there.
var age2 = 25
var longitude3 = -86.783333
var nothingInBrain2 = true

var name4: String = "Tim McGraw" //Can do this as well


//Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var x = 1.1
var y = 2.2
var z = x + y

var name1 = "Tim McGraw"
var name5 = "Romeo"
var both = name1 + " and " + name2

z > 3
z >= 3
z > 4
z < 4

name1 == "Tim McGraw"
name1 != "Tim McGraw"

var stayOutTooLate2 = true
stayOutTooLate2
!stayOutTooLate2


//String interpolation - combining variables and constants inside a string.
"Your name is \(name1)"
"Your name is " + name1

"Your name is \(name1), your age is \(age), and your latitude is \(latitude)"
"You are \(age) years old. In another \(age) years you will be \(age * 2)."


//Arrays
var evenNumbers = [2, 4, 6, 8]

var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
songs[0]
songs[1]
songs[2]
type(of: songs)

//var songs = ["Shake it Off", "You Belong with Me", "Back to December", 3] //heterogeneous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional

//var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December", 3] //cannot convert value of type 'Int' to expected element type 'String'

var songs2: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]
type(of: songs2)

var songs3: [String]
//songs3[0] = "Shake it Off" //variable 'songs3' passed by reference before being initialized

var songs4: [String] = []
var songs5 = [String]()

var songs6 = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs7 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both2 = songs6 + songs7

both2 += ["Everything has Changed"]


//Dictionaries
var person = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]
var personDict = ["first": "Taylor",
                  "middle": "Alison",
                  "last": "Swift",
                  "month": "December",
                  "website": "taylorswift.com"]
personDict["middle"]
personDict["month"]


//Conditional statements
var action: String
var personType = "hater"

if personType == "hater" {
    action = "hate"
} else if personType == "player" {
    action = "play"
} else {
    action = "cruise"
}

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}


//Loops
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1 ... 5 {
    str += " fake"
}

print(str)

for song in songs {
    print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ... 3 {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0 ..< people.count {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"

    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }

    print(str)
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

for song in songs {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}


//Switch case
let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}

let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}
