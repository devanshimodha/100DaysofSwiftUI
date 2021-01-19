import UIKit

/*
 # Day 15
 1. Properties
 2. Static properties and methods
 3. Access control
 4. Polymorphism and typecasting
 5. Closures
 
 # Additional
 Protocols
 Extensions
 Protocol extensions
 */

//Properties
struct Person {
    var clothes: String = "" {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    
    var age: Int = -1

    var ageInDogYears: Int {
        return age * 7
    }
    
    var shoes: String = ""

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

var taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
taylor.describe()
other.describe()

func updateUI(msg: String) {
    print(msg)
}

taylor.clothes = "short skirts"

var fan = Person(age: 25)
print(fan.ageInDogYears)


//Static properties and methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

    var name: String
    var age: Int
}

let fanTaylor = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)


//Access control
/*:
- Public: this means everyone can read and write the property.
- Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.
- File Private: this means that only Swift code in the same file as the type can read and write the property.
- Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.
 */
class TaylorFan2 {
    private var name: String?
}


//Polymorphism and typecasting
class Album {
    var name: String

    init(name: String) {
        self.name = name
    }

    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())

    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.location)
}

let number = 5
let text = String(number)
print(text)


//Closures
let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}


//Protocols
protocol Employee {
    var name: String { get set }
    var jobTitle: String { get set }
    func doWork()
}

struct Executive: Employee {
    var name = "Steve Jobs"
    var jobTitle = "CEO"

    func doWork() {
        print("I'm strategizing!")
    }
}

struct Manager: Employee {
    var name = "Maurice Moss"
    var jobTitle = "Head of IT"

    func doWork() {
        print("I'm turning it off and on again.")
    }
}

let staff: [Employee] = [Executive(), Manager()]

for person in staff {
    person.doWork()
}


//Extensions
var myInt = 0

extension Int {
    func plusOneReturn() -> Int {
        return self + 1
    }
    
    mutating func plusOne() {
        self += 1
    }
}
myInt.plusOneReturn()
5.plusOneReturn()
myInt

var myInt2 = 10
myInt2.plusOne()
myInt2

var str = "Hello World!   "
str = str.trimmingCharacters(in: .whitespacesAndNewlines)
print(str)

extension String {
    mutating func trim() {
        self = trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

str.trim()


//Protocol extensions
//self means “my current value” and Self means “my current data type.”
extension Int {
    func clamp(low: Int, high: Int) -> Int {
        if (self > high) {
            // if we are higher than the upper bound, return the upper bound
            return high
        } else if (self < low) {
            // if we are lower than the lower bound, return the lower bound
            return low
        }

        // we are inside the range, so return our value
        return self
    }
}

extension BinaryInteger {
    func clamp(low: Self, high: Self) -> Self {
        if (self > high) {
            return high
        } else if (self < low) {
            return low
        }

        return self
    }
}

let i: Int = 8
print(i.clamp(low: 0, high: 5))

let j: UInt64 = 8
print(j.clamp(low: 0, high: 5))

extension Employee {
    func doWork() {
        print("I'm busy!")
    }
}
