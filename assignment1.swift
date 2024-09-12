import Foundation


var firstName: String = "Arailym"
var lastName: String = "Bayaly"
var age: Int = 21
var birthYear: Int = 2003
var isStudent: Bool = true
var height: Double = 1.60
var studyYear: Int = 3
var school: String = “SITE”
let currentYear: Int = 2024
age = currentYear - birthYear

var city: String = "Taraz"
var favoriteColor: String = "Black"

var hobbies: String = "Hip-hop and Afro"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 17
var isHobbyCreative: Bool = true

var favoriteSport: String = "Dancing"
var favoriteSong: String = "DNA by Kendrick Lamar"


var lifeStory: String = "Hello! I'm \(firstName) \(lastName), currently \(age) years old and \(height) meters tall. Born in the year \(birthYear), in the amazing city of \(city). I'm now in my \(studyYear) year at \(school). One of my favorite activities is \(hobbies), which is \(isHobbyCreative ? "definitely creative" : "not exactly creative"). In total, I have \(numberOfHobbies) hobbies, and my lucky number happens to be \(favoriteNumber). I adore the color \(favoriteColor), and my favorite track is \(favoriteSong)."

print(lifeStory)

var futureGoals: String = " I want to influence and inspire people with my art. "
lifeStory += " \(futureGoals)"


print(lifeStory)
