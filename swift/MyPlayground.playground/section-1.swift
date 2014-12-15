// Playground - noun: a place where people can play

import UIKit

/// Strings ///
// var
var str = "Hello, playground"
// Cannot redeclar vars
// var str = "Cannot assign"
str = "Reassigned"

// const
let my_const = "ma man"

//Specific typing
var str2: String = "Hello"
let str3: String = "Hello3"

println("View -> Assistant Editor -> Show Assistant Editor")
// String interpolation
print("View -> Assistant Editor -> Show Assistant Editor \(my_const)")


/// Numbers and Bolleans ///
let year = 2014 //int
let version = 1.0 //Double

var isAwesome = true
var noAwesome: Bool = true

/// Operators and Precedence ///
var x = 1 + 1
// precedence level 150: mult, div and remainder
// precedence level 140: add, sub

//// Unary Operators ////
var levelScore = 10
levelScore = levelScore + 1
levelScore++

var totalScore = ++levelScore
totalScore
levelScore--
levelScore = -levelScore //mutiplies by negative 1

let on = true
let off = !on


//// Arrays ////
var todo: [String] = ["nho", "nho", "nho"]
todo += ["bla"]
todo[0]
todo.count

todo.append("nhanha")
todo.removeLast()


//// Dictionary (Unsorted) ///
var countries = [ "CA": "canada", "BE": "Belgium"]
countries["CA"]
countries["US"]
countries["US"] = "United States"
countries.removeValueForKey("US")
countries


//// Loops ///
for i in todo {
  println(i)
}

for n in 1...10 {
 println(n)
}

for n in 1..<10 {
    println(n)
}

var index = 0
while index < todo.count {
    print(todo[index])
    index++
}

var index2 = 0
do {
  print(todo[index2])
  index2++
} while index2 < todo.count

for var i = 0; i < todo.count; i++ {
 print(todo[i])
}




