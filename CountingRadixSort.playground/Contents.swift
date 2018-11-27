import UIKit

var str = "Hello, playground"


// Counting sort algo
func countingSort(upperBound k: Int, numOfIntegers n: Int) -> [Int] {
    
    // Call to helper fnx for generating random array of Ints
    let A = generateRandomIntArray(with: n, upperBound: k)
    var aux = [Int]()
    
    // Generate k 0s for the auxilary array
    for _ in 0...k {
        aux.append(0)
    }
    
    // Copy the amount of values in array A to aux
    for i in 0..<n {
        aux[A[i]] += 1
    }
    
    // Modify the aux array to show the amount of digits no greater than the current index
    for j in 1...k {
        aux[j] = aux[j] + aux[j-1]
    }
    
    // Generate a mappedArr w/ initial values of zero
    var mappedArr = [Int]()
    for _ in 0..<n {
        mappedArr.append(0)
    }
    print(aux)
    
    // Map array A using the auxillary array to the mappedArr
    for i in stride(from: n - 1, through: 0, by: -1) {
        mappedArr[aux[A[i]] - 1] = A[i]
        aux[A[i]] = aux[A[i]] - 1
        print(mappedArr)
    }
    
    return mappedArr
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
    
    print(aux)

    return aux
}

print(countingSort(upperBound: 10, numOfIntegers: 5))
