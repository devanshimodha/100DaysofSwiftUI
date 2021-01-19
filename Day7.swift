import UIKit

/*
 # Day 7
 1. Using closures as parameters when they accept parameters
 2. Using closures as parameters when they return values
 3. Shorthand parameter names
 4. Closures with multiple parameters
 5. Returning closures from functions
 6. Capturing values
 7. Closures summary
 */

//Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

func buildCar(name: String, engine: (Int) -> Void) {
    // build the car
    print("\(name) \(engine(100))")
}

buildCar(name: "Tesla") { (speed) in
    print("Car Speed \(speed)")
}


//Using closures as parameters when they return values
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
    // start with a total equal to the first value
    var current = values[0]

    // loop over all the values in the array, counting from index 1 onwards
    for value in values[1...] {
        // call our closure with the current value and the array element, assigning its result to our current value
        current = closure(current, value)
    }

    // send back the final current value
    return current
}

let numbers = [10, 20, 30]

let sum = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal + next
}
print(sum)

let sumOther = reduce(numbers, using: +)
print(sumOther)

let multiplied = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal * next
}
print(multiplied)


//Shorthand parameter names
travel { place -> String in
    return "I'm going to \(place) in my car"
}

travel { place in
    return "I'm going to \(place) in my car"
}

travel { place in
    "I'm going to \(place) in my car"
}

travel {
    "I'm going to \($0) in my car"
}


//Closures with multiple parameters
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}


//Returning closures from functions
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")

let result2: Void = travel()("London")

print(Int.random(in: 1...10))

func getRandomNumber()-> Int {
    Int.random(in: 1...10)
}

print(getRandomNumber())

func makeRandomGenerator() -> () -> Int {
    let function = { Int.random(in: 1...10) }
    return function
}

let generator = makeRandomGenerator()
let random1 = generator()
print(random1)


//Capturing values
func travel1() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result1 = travel1()
result1("London")
result1("London")
result1("London")

func makeRandomNumberGenerator() -> () -> Int {
    var previousNumber = 0
    return {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 1...3)
        } while newNumber == previousNumber

        previousNumber = newNumber
        return newNumber
    }
}

let generatorRandom = makeRandomNumberGenerator()

for _ in 1...10 {
    print(generatorRandom())
}

//Advanced
class Pokemon: CustomDebugStringConvertible {
  let name: String
  init(name: String) {
    self.name = name
  }
  var debugDescription: String { return "<Pokemon \(name)>" }
  deinit { print("\(self) escaped!") }
}

func delay(_ seconds: Int, closure: @escaping ()->()) {
  let time = DispatchTime.now() + .seconds(seconds)
  DispatchQueue.main.asyncAfter(deadline: time) {
    print("🕑")
    closure()
  }
}

func demo1() {
  let pokemon = Pokemon(name: "Mewtwo")
  print("before closure: \(pokemon)")
  delay(1) {
    print("inside closure: \(pokemon)")
  }
  print("bye")
}
demo1()

func demo2() {
  var pokemon = Pokemon(name: "Pikachu")
  print("before closure: \(pokemon)")
  delay(1) {
    print("inside closure: \(pokemon)")
  }
  pokemon = Pokemon(name: "Mewtwo")
  print("after closure: \(pokemon)")
}
demo2()

func demo3() {
  var value = 42
  print("before closure: \(value)")
  delay(1) {
    print("inside closure: \(value)")
  }
  value = 1337
  print("after closure: \(value)")
}
demo3()

func demo4() {
  var value = 42
  print("before closure: \(value)")
  delay(1) {
    print("inside closure 1, before change: \(value)")
    value = 1337
    print("inside closure 1, after change: \(value)")
  }
  delay(2) {
    print("inside closure 2: \(value)")
  }
}
demo4()

func demo5() {
  var value = 42
  print("before closure: \(value)")
  delay(1) { [constValue = value] in
    print("inside closure: \(constValue)")
  }
  value = 1337
  print("after closure: \(value)")
}
demo5()

func demo6() {
  var pokemon = Pokemon(name: "Pikachu")
  print("before closure: \(pokemon)")
  delay(1) { [pokemonCopy = pokemon] in
    print("inside closure: \(pokemonCopy)")
  }
  pokemon = Pokemon(name: "Mewtwo")
  print("after closure: \(pokemon)")
}
demo6()

func demo6_equivalent() {
  var pokemon = Pokemon(name: "Pikachu")
  print("before closure: \(pokemon)")
  // here we create an intermediate variable to hold the instance
  // pointed by the variable at that point in the code:
  let pokemonCopy = pokemon
  delay(1) {
    print("inside closure: \(pokemonCopy)")
  }
  pokemon = Pokemon(name: "Mewtwo")
  print("after closure: \(pokemon)")
}

demo6_equivalent()

func demo7() {
  var pokemon = Pokemon(name: "Mew")
  print("➡️ Initial pokemon is \(pokemon)")

  delay(1) { [capturedPokemon = pokemon] in
    print("closure 1 — pokemon captured at creation time: \(capturedPokemon)")
    print("closure 1 — variable evaluated at execution time: \(pokemon)")
    pokemon = Pokemon(name: "Pikachu")
    print("closure 1 - pokemon has been now set to \(pokemon)")
  }

  pokemon = Pokemon(name: "Mewtwo")
  print("🔄 pokemon changed to \(pokemon)")

  delay(2) { [capturedPokemon = pokemon] in
    print("closure 2 — pokemon captured at creation time: \(capturedPokemon)")
    print("closure 2 — variable evaluated at execution time: \(pokemon)")
    pokemon = Pokemon(name: "Charizard")
    print("closure 2 - value has been now set to \(pokemon)")
  }
}
demo7()
///#Summary
/*
 1. You can assign closures to variables, then call them later on.
 2. Closures can accept parameters and return values, like regular functions.
 3. You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
 4. If the last parameter to your function is a closure, you can use trailing closure syntax.
 5. Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
 6. If you use external values inside your closures, they will be captured so the closure can refer to them later.
 */
