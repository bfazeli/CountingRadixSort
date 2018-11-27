import UIKit

var str = "Hello, playground"


// Counting sort algo
func countingSort(upperBound k: Int, numOfIntegers n: Int) -> [Int] {
    
    // Call to helper fnx for generating random array of Ints
    let A = generateRandomIntArray(with: n, upperBound: k)
    let aux = [Int]()
    
    // Generate k 0s for the auxilary array
    for _ in 0..<k {
        aux.append(0)
    }
    
    return A
}


/*
 Generates an array of random Ints
 
 ** Random ints will be between 0 to k

*/
func generateRandomIntArray(with n: Int, upperBound k: Int) -> [Int] {
    var aux = [Int]()
    
    
    for _ in 0..<n {
        aux.append(Int.random(in: 0...k))
    }

    return aux
}

print(countingSort(upperBound: 10, numOfIntegers: 5))
