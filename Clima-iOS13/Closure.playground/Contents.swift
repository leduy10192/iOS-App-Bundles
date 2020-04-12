import UIKit

let array = [6,2,3,9,4,1]

//map: transform every single item in a collection type: array or dictionary


let newArray = array.map{"\($0)"} //Stringify each element
print(newArray)
