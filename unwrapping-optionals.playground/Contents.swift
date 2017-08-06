//: Playground - noun: a place where people can play

import UIKit

var optionalNumber: Int?
//optionalNumber = 23


// IF LET

if let number = optionalNumber {
    print("I have a value, it is \(number)")
} else {
    print("I do not have a value, I am nil")
}


// GUARD

func tripleNumber(number: Int?) {
    
    guard let number = number else {
        print("Exiting Function")
        return
    }
    
    print("My tripled number is \(number * 3)")
}

tripleNumber(number: optionalNumber)


// FORCE UNWRAPPING
//let forcedNumber = optionalNumber!


//OPTIONAL CHAINING

struct Device {
    var type: String
    var price: Float?
    var color: String
}

var myPhone: Device?
myPhone = Device(type: "Phone", price: 699.0, color: "Space Grey")

let devicePrice = myPhone?.price

if let devicePrice = devicePrice {
    print("My total price = \(devicePrice + 8.99)")
}



_ = Timer(timeInterval: 2.0, target: self, selector: #selector(timerAcabou), userInfo: nil, repeats: true)

// _ = Timer(timeInterval: timerScanInterval, target: self, selector: #selector(pauseScan), userInfo: nil, repeats: false)

func timerAcabou (){
    print("Timer acabou!")
}





















