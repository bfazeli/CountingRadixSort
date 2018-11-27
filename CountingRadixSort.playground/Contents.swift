import UIKit

var str = "Hello, playground"

// Radix sort
func radixSort(numOfDigits d: Int, numOfInts n: Int) -> [Int] {
    var A = generateRandomIntArray(with: n, upperBound: nil, digits: d)
    
    return A
}

// Counting sort algo
func countingSort(upperBound k: Int, numOfIntegers n: Int) -> [Int] {
    
    // Call to helper fnx for generating random array of Ints
    let A = generateRandomIntArray(with: n, upperBound: k, digits: nil)
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
func generateRandomIntArray(with n: Int, upperBound k: Int?, digits d: Int?) -> [Int] {
    var aux = [Int]()
    var lowerLimit: Int = 0
    var upperLimit: Int = 0
    
    if let digits = d {
        if digits == 1 {
            upperLimit = 10
        }
        else if digits > 1 {
            let d = digits
            lowerLimit = 1
            for _ in 1..<d {
                lowerLimit *= 10
            }
            upperLimit = lowerLimit * 10
        }
    } else if let upperBound = k {
        upperLimit = upperBound
    }
    
    for _ in 0..<n {
        aux.append(Int.random(in: lowerLimit...upperLimit))
    }
    
    print(aux)

    return aux
}



// print(countingSort(upperBound: 10, numOfIntegers: 5))
radixSort(numOfDigits: 4, numOfInts: 10)
