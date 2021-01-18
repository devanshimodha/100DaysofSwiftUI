import UIKit

/*
 # Day 14
 1. Functions
 2. Optionals
 3. Optional chaining
 4. Enumerations
 5. Structs
 6. Classes
 */

//Functions
func favoriteAlbum() {
    print("My favorite is Fearless")
}
favoriteAlbum()

func favoriteAlbum2(name: String) {
    print("My favorite is \(name)")
}
favoriteAlbum2(name: "Fearless")


func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}
printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)

func countLettersInString(string: String) {
    print("The string \(string) has \(string.count) letters.")
}
countLettersInString(string: "Hello")

func countLettersInString2(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}
countLettersInString2(myString: "Hello")

func countLettersInString3(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}
countLettersInString3("Hello")

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}
countLetters(in: "Hello")

func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }

    return false
}

if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

if albumIsTaylor(name: "Blue") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}


//Optionals
func getHaterStatus() -> String {
    return "Hate"
}

func getHaterStatus2() -> String? {
    return "Hate"
}

func getHaterStatus3(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

//var status: String
//status = getHaterStatus3(weather: "rainy") //value of optional type 'String?' must be unwrapped to a value of type 'String'

var status: String?
status = getHaterStatus3(weather: "rainy")

var status2 = getHaterStatus3(weather: "rainy")

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let unwrappedStatus = status2 {
    // unwrappedStatus contains a non-optional value!
    print(unwrappedStatus)
} else {
    // in case you want an else block, here you go…
}

if let haterStatus = getHaterStatus3(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}

func yearAlbumReleased(name: String) -> Int {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return 0
}

func yearAlbumReleased2(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}

var year = yearAlbumReleased2(name: "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year)")
    print("It was released in \(year!)")
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int {
    for i in 0 ..< array.count {
        if array[i] == string {
            return i
        }
    }

    return 0
}

let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)


//Optional chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2006)
print("The album is \(album)")

let str = "Hello world"
print(str.uppercased())

let album2 = albumReleased(year: 2006)?.uppercased()
print("The album is \(album2)")

//Swift will check them from left to right until it finds nil, at which point it stops.
//let album = albumReleased(year: 2006)?.someOptionalValue?.someOtherOptionalValue?.whatever

let album4 = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album4)")


//Enumerations
func getHaterStatus4(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

enum WeatherType {
    case sun, cloud, rain, wind, snow
}

func getHaterStatus5(weather: WeatherType) -> String? {
    if weather == WeatherType.sun {
        return nil
    } else {
        return "Hate"
    }
}

getHaterStatus5(weather: WeatherType.cloud)

enum WeatherType2 {
    case sun
    case cloud
    case rain
    case wind
    case snow
}

func getHaterStatus6(weather: WeatherType2) -> String? {
    if weather == .sun {
        return nil
    } else {
        return "Hate"
    }
}

getHaterStatus6(weather: .cloud)

func getHaterStatus7(weather: WeatherType2) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

enum WeatherType3 {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus8(weather: WeatherType3) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus8(weather: WeatherType3.wind(speed: 5))


//Structs
//When you write a function inside a struct, it's called a method instead
struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)


//Classes
class Person2 {
    var clothes: String
    var shoes: String

    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class Singer {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func sing() {
        print("La la la la")
    }
}

var taylorClass = Singer(name: "Taylor", age: 25)
taylorClass.name
taylorClass.age
taylorClass.sing()

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

var taylorSinger = CountrySinger(name: "Taylor", age: 25)
taylorSinger.sing()

class HeavyMetalSinger: Singer {
    var noiseLevel: Int

    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }

    override func sing() {
        print("Grrrrr rargh rargh rarrrrgh!")
    }
}
