import Foundation

func clearWords(from sentence: String) -> [String : Int] {
    let cleaned = sentence.lowercased().filter{
        !$0.isPunctuation
    }
    
    
    let words = cleaned.split(separator: " ").map{ String($0)}
    
    var dict: [String : Int] = [:]
    
    for word in words{
        dict[word, default: 0] += 1
    }
    
    return dict
}

func countWords(){
    print("Enter a sentence")
    
    if let input = readLine() {
        let words = clearWords(from: input)
        
        print("\nWord Counts:")
        
        for (word, count) in words {
            print("\(word): \(count)")
        }
    }
    else {
        print("Invalid input")
    }
}

countWords()