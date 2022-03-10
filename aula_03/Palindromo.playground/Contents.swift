import UIKit

func palindrome(name: String) -> Bool {
    let reverseString = String(name.reversed())
    if reverseString.filter({!$0.isWhitespace}) == name.filter({!$0.isWhitespace}) {
        return true
    } else {
        return false
    }
}

print(palindrome(name: "a base do teto desaba"))
