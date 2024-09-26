import Foundation
// Problem 6

func fibonacci(_ n : Int) -> [Int]{
    
    guard n > 0 else { return []}
    
    if n == 1 {
            return [0]
        }
    
    var fib: [Int] = [0, 1]
    
    for i in 2..<n {
        fib.append(fib[i - 1] + fib[i - 2])
    }
    
    return fib;
}