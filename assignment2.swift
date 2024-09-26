import UIKit

// easy part
//1
var fruits:[String] = ["banana", "apple", "mango", "pineapple", "strawberry"]
print(fruits[2])

//2
var myFavouriteNumbers: Set<Int> = [17, 32, 33, 7, 5, 99, 66]
myFavouriteNumbers.insert(255)
print(myFavouriteNumbers)

//3
var releasedDateOfLanguages: Dictionary<String, Int> = ["Swift" : 2014, "Python" : 1991, "JavaScript" : 1997]
print(releasedDateOfLanguages["Swift"]!)

//4
var colors: [String] = ["black", "white", "grey"]
colors[1] = "yellow"
print(colors)

// medium tasks
//1
var setNum1: Set<Int> = [1, 2, 3, 4]
var setNum2: Set<Int> = [3, 4, 5, 6]
let intersection = setNum1.intersection(setNum2)
print(intersection)


//2
var scores: Dictionary<String, Double> = [
    "Kausar" : 3.50,
    "Temirlan" : 3.67,
    "Tokzhan" : 2.88
]
scores["Kausar"] = 2.94
print(scores)


//3
var fruits1:[String] = ["bananas", "apple"]
var fruits2:[String] = ["cherry", "date"]
fruits1 += fruits2
print(fruits1)


// hard tasks
//1
var countries: Dictionary<String, Int> = ["Kazakhstan" : 19620000, "USA" : 1897890000, "Turkey" : 9953000]
countries["Canada"] = 333000000
print(countries)

//2
var firstSet: Set<String> = ["cat", "dog"]
var secondSet: Set<String> = ["dog", "mouse"]
var result = firstSet.union(secondSet)
print(result.subtracting(secondSet))


//3
let studentGrades: [String: [Dictionary<String, Int>]] = [
    "Zhanar": [56, 61, 75],
    "Laura": [99, 89, 85],
    "Justin": [82, 78, 81]
]

if let grade = studentGrades["Laura"] {
    print(grade[1])
}









