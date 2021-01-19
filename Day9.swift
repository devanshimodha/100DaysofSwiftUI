import UIKit

/*
 # Day 9
 1. Initializers
 2. Referring to the current instance
 3. Lazy properties
 4. Static properties and methods
 5. Access control
 6. Structs summary
 */

//Initializers
//All structs come with one by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.
struct User {
    var username: String
}
var user = User(username: "twostraws")

struct User2 {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user2 = User2()
user2.username = "twostraws"

struct Employee {
    var name: String
    var yearsActive = 0
}

let roslin = Employee(name: "Laura Roslin")
let adama = Employee(name: "William Adama", yearsActive: 45)

struct Employee2 {
    var name: String
    var yearsActive = 0

    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

//let laura = Employee2(name: "Laura Roslin") //Argument passed to call that takes no arguments

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let laura = Employee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee()


//Referring to the current instance
//self helps you distinguish between the property and the parameter – self.name refers to the property, whereas name refers to the parameter.
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

struct Student {
    var name: String
    var bestFriend: String

    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class…")
        self.name = name
        self.bestFriend = bestFriend
    }
}

struct Student2 {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}


//Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
ed.familyTree


//Static properties and methods
struct StudentClass {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        StudentClass.classSize += 1
    }
}

let ed2 = StudentClass(name: "Ed")
let taylor = StudentClass(name: "Taylor")
print(StudentClass.classSize)

struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
    
    private static var entropy = Int.random(in: 1...1000)

    static func getEntropy() -> Int {
        entropy += 1
        return entropy
    }
}


//Access control
//public, which lets all other code use the property or method.
struct Person3 {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed3 = Person3(id: "12345")
ed3.identify()




///#Summary
/*
 1. You can create your own types using structures, which can have their own properties and methods.
 2. You can use stored properties or use computed properties to calculate values on the fly.
 3. If you want to change a property inside a method, you must mark it as mutating.
 4. Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
 5. Use the self constant to refer to the current instance of a struct inside a method.
 6. The lazy keyword tells Swift to create properties only when they are first used.
 7. You can share properties and methods across all instances of a struct using the static keyword.
 8. Access control lets you restrict what code can use properties and methods.
 */
