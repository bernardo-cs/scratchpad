// Playground - noun: a place where people can play

import UIKit

func calculateArea(x: String, y: String){
 println("\(x) \(y)")
}
calculateArea("ola", "Adues")

func calcAr(#height: Int, #width: Int) -> Int{
  return height * width
}
println("Area = \( calcAr(height: 10, width: 20) )")


/// Tuples  ///
func searchNames(#name: String) -> (found: Bool, msg: String) {
  let names = ["ola", "Adeus", "lalal"]
 
    var found = (false, "\(name) is not in array")
  
    for n in names{
        if n == name {
         found = (true, "\(name) is in array")
        }
    }
    
    return found
}

let result = searchNames(name: "Maname")
result.found
result.msg

