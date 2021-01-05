import UIKit

//Enums and Equatable
enum SocialPlatform {
    case twitter
    case facebook
    case instagram
}

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
