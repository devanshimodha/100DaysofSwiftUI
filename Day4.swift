import UIKit

/*
 # Day 1
 1. For loops
 2. While loops
 3. Repeat loops
 4. Exiting loops
 5. Exiting multiple loops
 6. Skipping items
 7. Infinite loops
 8. Looping summary
*/

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
    print("\(name) is a secret agent")
}

for _ in names {
    print("[CENSORED] is a secret agent!")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}


//The main difference is that for loops are generally used with finite sequences. On the other hand, while loops can loop until any arbitrary condition becomes false, which allows them until we tell them to stop.
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")



number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

while false {
    print("This is false")
}

repeat {
    print("This is false")
} while false

let numbers = [1, 2, 3, 4, 5]
var random = numbers.shuffled()

while random == numbers {
    random = numbers.shuffled()
}

var randomNumbers: [Int]

repeat {
    randomNumbers = numbers.shuffled()
} while randomNumbers == numbers


var countDown = 10
while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("Blast off!")

countDown = 10
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

let scores = [1, 8, 4, 3, 0, 5, 2]
var scoreCount = 0

for score in scores {
    if score == 0 {
        break
    }

    scoreCount += 1
}

print("You had \(scoreCount) scores before you got 0.")


for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]
for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
            }
        }
    }
}

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


//When we use continue we’re saying “I’m done with the current run of this loop” – Swift will skip the rest of the loop body, and go to the next item in the loop. But when we say break we’re saying “I’m done with this loop altogether, so get out completely.” That means Swift will skip the remainder of the body loop, but also skip any other loop items that were still to come.
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}



var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

var isAlive = false

while isAlive == true {
    print("I'm alive!")
}

print("I've snuffed it!")

///#Summary
/*
1. Loops let us repeat code until a condition is false.
2. The most common loop is for, which assigns each item inside the loop to a temporary constant.
3. If you don’t need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work.
4. There are while loops, which you provide with an explicit condition to check.
5. Although they are similar to while loops, repeat loops always run the body of their loop at least once.
6. You can exit a single loop using break, but if you have nested loops you need to use break followed by whatever label you placed before your outer loop.
7. You can skip items in a loop using continue.
8. Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a condition somewhere to end your infinite loops!
 */
