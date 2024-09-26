import Foundation
//Problem 9
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}


func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}


func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}


func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        print("Error: Cannot divide by zero.")
        return nil
    }
    return a / b
}


func getUserInput() -> (Double, Double, String)? {
    print("Enter first number:")
    guard let input1 = readLine(), let num1 = Double(input1) else {
        print("Invalid input for first number.")
        return nil
    }

    print("Enter second number:")
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid input for second number.")
        return nil
    }

    print("Choose an operation (+, -, *, /):")
    guard let operation = readLine(), ["+", "-", "*", "/"].contains(operation) else {
        print("Invalid operation selected.")
        return nil
    }

    return (num1, num2, operation)
}


func calculate() {
    if let (num1, num2, operation) = getUserInput() {
        var result: Double?

        switch operation {
        case "+":
            result = add(num1, num2)
        case "-":
            result = subtract(num1, num2)
        case "*":
            result = multiply(num1, num2)
        case "/":
            result = divide(num1, num2)
        default:
            print("Operation not recognized.")
        }

        if let finalResult = result {
            print("Result: \(finalResult)")
        }
    }
}


func runCalculator() {
    var keepGoing = true

    while keepGoing {
        calculate()

        print("Do you want to do another calculation? (yes/no):")
        if let response = readLine()?.lowercased(), response != "yes" {
            keepGoing = false
        }
    }

    print("Calculator exiting.")
}


runCalculator()