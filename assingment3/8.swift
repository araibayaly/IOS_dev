import Foundation
//Problem 8

func isPalindrome(_ text: String) -> Bool{
    let cleanedText = text.lowercased().filter{ $0.isLetter }
    
    return cleanedText == String(cleanedText.reversed())
}

