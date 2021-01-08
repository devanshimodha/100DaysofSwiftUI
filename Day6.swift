import UIKit

/*
 # Day 6
 1. Creating basic closures
 2. Accepting parameters in a closure
 3. Returning values from a closure
 4. Closures as parameters
 5. Trailing closure syntax
 */

//You can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters. Functions used in this way are called closures.
let driving = {
    print("I'm driving in my car")
}
driving()


/*To make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting.
One of the differences between functions and closures is that you don’t use parameter labels when running closures.
 */
let drivingParameter = { (place: String) in
    print("I'm going to \(place) in my car")
}
drivingParameter("London")

func pay(user: String, amount: Int) {
    // code
}

let payment = { (user: String, amount: Int) in
    print("Paying \(user)…")
}


let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)

let paymentWithReturn = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}

let paymentWithoutParameter = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}


func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)


travel() {
    print("I'm driving in my car")
}

travel {
    print("I'm driving in my car")
}

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

animate(duration: 3, animations: {
    print("Fade out the image")
})

animate(duration: 3) {
    print("Fade out the image")
}
