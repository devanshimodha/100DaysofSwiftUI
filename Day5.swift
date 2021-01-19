import UIKit

/*
 # Day 5
 1. Writing functions
 2. Accepting parameters
 3. Returning values
 4. Parameter labels
 5. Omitting parameter labels
 6. Default parameters
 7. Variadic functions
 8. Writing throwing functions
 9. Running throwing functions
 10. inout parameters
 11. Functions summary
 */

//Running a function is often referred to as calling a function.
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}

printHelp()


//Values sent into functions this way are called parameters.
print("Hello, world!")

func square(number: Int) {
    print(number * number)
}

square(number: 8)


func squareReturn(number: Int) -> Int {
    return number * number
}

let result = squareReturn(number: 8)
print(result)


func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

func setReactorStatus(primaryActive: Bool, backupActive: Bool, isEmergency: Bool) {
    // code here
}

setReactorStatus(primaryActive: true, backupActive: true, isEmergency: false)

func setAge(for person: String, to value: Int) {
    print("\(person) is now \(value)")
}

setAge(for: "Paul", to: 40)
//setAge(person: "Paul", value: 40) //incorrect argument labels in call (have 'person:value:', expected 'for:to:')


func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}

func greet(name: String) -> String {
    if name == "Taylor Swift" {
        return "Oh wow!"
    } else {
        return "Hello, \(name)"
    }
}

//Missing return in a function expected to return 'String'
//func greet(name: String) -> String {
//    if name == "Taylor Swift" {
//        "Oh wow!"
//    } else {
//        "Hello, \(name)"
//    }
//}

func greetTernary(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print(user[0])

func getUserDictionary() -> [String: String] {
    ["first": "Taylor", "last": "Swift"]
}

let userName = getUserDictionary()
print(userName["first"])

func getUserTuples() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let userTuple = getUserTuples()
print(userTuple.first)


func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")


func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)


print("Haters", "gonna", "hate")
//You can make any parameter variadic by writing ... after its type.
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)


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
    let data = "hello, world".data(using: .utf8)!
    let decoder = JSONDecoder()
    let string = try decoder.decode(String.self, from: data)
} catch { error
    print("something went wrong!")
    print(error)
}

do {
    let data = "hello, world".data(using: .utf8)!
    let decoder = JSONDecoder()
    let string = try decoder.decode(String.self, from: data)
} catch is DecodingError {
    print("something went wrong while decoding!")
} catch { error
    print("something went wrong!")
    print(error)
}

enum MyError: Error {
    case myErrorCase
    case intLargerThanThree
}

func doSomething() throws {
    throw MyError.myErrorCase
}

print(try? doSomething())

let data = "hello, world".data(using: .utf8)!
let decoder = JSONDecoder()
let string = try? decoder.decode(String.self, from: data)

print(string)

//try! doSomething() //error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0). The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.

func returnsOptionalString() throws -> String? {
    // do work
    return "optionalString"
}

let stringOptional = try? returnsOptionalString()

if stringOptional == nil {
    // why is string nil? Is it due to an error? Or did the function execute successfully and we just got back nil without encountering any errors?
}

func decodeJSON(_ data: Data) throws -> String {
    let decoder = JSONDecoder()
    let decodedString = try decoder.decode(String.self, from: data)
    
    return decodedString
}

func execute(_ closure: (() throws -> Void)) throws {
    try closure()
}

do {
    try execute {
        print("hello!")
    }
    
    try execute {
        throw MyError.myErrorCase
    }
} catch {
    print(error)
}

func executeRethrow(_ closure: (() throws -> Void)) rethrows {
  try closure()
}

executeRethrow {
  print("hello!")
}

do {
  try executeRethrow {
    throw MyError.myErrorCase
  }
} catch {
  print(error)
}

let mapped: [Int] = try [1, 2, 3].map { int in
  if int > 3 {
    throw MyError.intLargerThanThree
  }

  return int * 2
}

func doSomethingAgain() throws {
  throw MyError.myErrorCase

  print("This is never printed")
}


do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//try makes it clear that the first, third, and fifth function calls can throw errors, but the second and fourth cannot.
do {
    try doSomethingAgain()
    getUserDictionary()
    try doSomethingAgain()
    getUserDictionary()
    try doSomethingAgain()
} catch {
    // handle errors
    print("Error")
}


func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)

//func +(leftNumber: Int, rightNumber: Int) -> Int {
//    // code here
//}
//
//func +=(leftNumber: inout Int, rightNumber: Int) {
//    // code here
//}


///#Summary
/*
 1. Functions let us re-use code without repeating ourselves.
 2. Functions can accept parameters – just tell Swift the type of each parameter.
 3. Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
 4. You can use different names for parameters externally and internally, or omit the external name entirely.
 5. Parameters can have default values, which helps you write less code when specific values are common.
 6. Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
 7. Functions can throw errors, but you must call them using try and handle errors using catch.
 8. You can use inout to change variables inside a function, but it’s usually better to return a new value.
 */
