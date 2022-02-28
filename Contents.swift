import Cocoa

var unsorted = (0..<20).map{ _ in Int.random(in: 1 ... 100) }

func mergeSort(_ unsorted: [Int]) -> [Int] {
    if unsorted.count < 2 {
        return unsorted
    }
    
    let mid = (unsorted.count / 2)
    
    let left = mergeSort(Array(unsorted[unsorted.startIndex..<mid]))
    let right = mergeSort(Array(unsorted[mid..<unsorted.endIndex]))
    return merge(left: left, right: right)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var ordered: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            ordered.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            ordered.append(rightElement)
            rightIndex += 1
        } else {
            ordered.append(leftElement)
            leftIndex += 1
            ordered.append(rightElement)
            rightIndex += 1

        }
    }
    
    while leftIndex < left.count {
        ordered.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count{
        ordered.append(right[rightIndex])
        rightIndex += 1
    }
    
    return ordered
}

let sorted = mergeSort(unsorted)
