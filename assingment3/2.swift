import Foundation

func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false;
    }
    
    let upperBound = Int(Double(num).squareRoot())
        if upperBound < 2 {
            return true
        }
        
        for i in 2...upperBound {
            if num % i == 0 {
                return false
            }
        }
    
    return true;
}

for j in 1...100 {
    print("\(j) is prime: \(isPrime(j))");
}
