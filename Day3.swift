import UIKit
/*
# Day 3
1. Arithmetic Operators
2. Operator overloading
3. Compound assignment operators
4. Comparison operators
5. Conditions
6. Combining conditions
7. The ternary operator
8. Switch statements
9. Range operators
10. Enum raw values
11. Operators and conditions summary
*/


//Double uses the same amount of memory to store its value as Int
let firstScore = 12
let secondScore = 4
let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
//Swift has an operator allows us to calculate the remainder after a division. This is sometimes called modulo.
let remainder = 13 % secondScore

let weeks = 465 / 7
print("There are \(weeks) weeks until the event.")

let weeksDouble: Double = 465 / 7
print("There are \(weeksDouble) weeks until the event.")

let days = 465 % 7
print("There are \(weeks) weeks and \(days) days until the event.")

let number = 465
let isMultiple = number.isMultiple(of: 7)


//Remember, Swift is a type-safe language, which means it won’t let you mix types.
let meaningOfLife = 42
let doubleMeaning = 42 + 42
let fakers = "Fakers gonna "
let action = fakers + "fake"
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf


var score = 95
score -= 5
var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"


let scoreOne = 6
let scoreTwo = 4
scoreOne == scoreTwo
scoreOne != scoreTwo
scoreOne < scoreTwo
scoreOne >= scoreTwo
"Taylor" <= "Swift"

let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
//That will print “true”, because Swift small comes before large in the enum case list.
print(first < second)


let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

let gameScore = 9001
// This needs to check the value of score twice
if gameScore > 9000 {
    print("It's over 9000!")
}
if gameScore <= 9000 {
    print("It's not over 9000!")
}
//Use else for optimization
if score > 9000 {
    print("It's over 9000!")
} else {
    print("It's not over 9000!")
}

if score > 9000 {
    print("It's over 9000!")
} else {
    if score == 9000 {
        print("It's exactly 9000!")
    } else {
        print("It's not over 9000!")
    }
}

//Code easier to read by using else if
if score > 9000 {
    print("It's over 9000!")
} else if score == 9000 {
    print("It's exactly 9000!")
} else {
    print("It's not over 9000!")
}


let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

var isOwner = true
var isAdmin = true
var isEditingEnabled = true

if isOwner == true || isAdmin == true {
    print("You can delete this post")
}

if isOwner == true && isEditingEnabled || isAdmin == true {
    print("You can delete this post")
}

if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}

if isOwner == true && (isEditingEnabled || isAdmin == true) {
    print("You can delete this post")
}

if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}


print(firstCard == secondCard ? "Cards are the same" : "Cards are different")
if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}
let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "Who are you?")
if isAuthenticated {
    print("Welcome")
} else {
    print("Who are you?")
}


let weather = "sunny"
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}


switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[0])
print(names[1...3])
print(names[1...])

//Closed range operator
let range: ClosedRange = 0...10
print(range.first!) // 0
print(range.last!) // 10
for index in 0...2 {
    print("Name \(index) is \(names[index])")
}
let countableRange: CountableClosedRange = 0...2
print(names[countableRange])
print(names[0...2])

//Half-open range operator
let halfRange: Range = 0..<10
print(halfRange.first!) // 0
print(halfRange.last!) // 9
print(names[0..<names.count])

//One-sided operator
print(names[...2])
print(names[1...])

let neededNames = 2
var collectedNames: [String] = []
for index in 0... {
    guard collectedNames.count != neededNames else { break }
    collectedNames.append(names[index])
}
print(collectedNames) // ["Antoine", "Maaike"]

//Converting a Range to an NSRange in Swift
let title = "A Swift Blog"
let titleRange = title.range(of: "Swift")
let attributedString = NSMutableAttributedString(string: title)
//attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], range: titleRange) // Cannot convert value of type 'Range<String.Index>?' to expected argument type 'NSRange' (aka '_NSRange')
let convertedRange = NSRange(titleRange!, in: title)
attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], range: convertedRange)
print(attributedString)

//Ranges and Strings
let emojiText: NSString = "?launcher"
print(emojiText.substring(with: NSRange(location: 0, length: 2)))

let strEmojiText = "?launcher"
let endIndex = strEmojiText.index(strEmojiText.startIndex, offsetBy: 2)
let rangeString: Range<String.Index> = strEmojiText.startIndex..<endIndex
print(strEmojiText[rangeString]) // ?l

///#Summary
/*
1. Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
2. There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
3. You can use if, else, and else if to run code based on the result of a condition.
4. Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
5. If you have multiple conditions using the same value, it’s often clearer to use switch instead.
6. You can make ranges using ..< and ... depending on whether the last number should be excluded or included.
*/
