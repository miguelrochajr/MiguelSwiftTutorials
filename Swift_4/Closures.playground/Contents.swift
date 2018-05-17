////: Playground - noun: a place where people can play
//
import UIKit
import Foundation
//
//func filterGreatrThanValue(value: Int, numbers: [Int]) -> [Int] {
//    var filteredValues = [Int]()
//    for num in numbers {
//        if num > value {
//            filteredValues.append(num)
//        }
//    }
//    return filteredValues
//}
//
//func filterWithPredicateClosure(closure: (Int) -> (Bool), numbers: [Int]) -> [Int]{
//    var filteredValues = [Int]()
//    for num in numbers {
//        // perfom condition test
//        if closure(num) {
//            filteredValues.append(num)
//        }
//    }
//    return filteredValues
//}
//
//func greaterThanThree(value: Int) -> Bool {
//    return value > 3
//}
//
//let filteredList = filterWithPredicateClosure(closure: greaterThanThree, numbers: [1, 2, 3, 4, 5, 10])
//
////let filteredList = filterWithPredicateClosure(closure: { (num) -> (Bool) in
////    return num < 20
////}, numbers: [1, 2, 3, 4, 5, 10])
//
//print(filteredList)
//
//
//
//// ESCAPING CLOSURES
//
//var completionHandlers: [() -> Void] = []
//
//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
//}
//
//func someFunctionWithNonescapingClosure(closure: () -> Void) {
//    closure()
//}
//
//
//class SomeClass {
//    var x = 10
//    func doSomething(){
//        someFunctionWithEscapingClosure {self.x = 100 }
//        someFunctionWithNonescapingClosure { x = 200 }
//    }
//}
//
//let instance = SomeClass()
//instance.doSomething()
//print(instance.x)
//
//completionHandlers.count
//completionHandlers.first?()
//print(instance.x)
//
//
//let dateFormatter = DateFormatter()
//DateFormatter.dateFormat(fromTemplate: "MM-dd-yyyy HH:mm", options: 0, locale: nil)
//dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
//var dateStr = dateFormatter.string(from: Date())
//let a = dateStr.replacingOccurrences(of: "-", with: "/")
////dateFormatter.string(from: Date()).split(separator: " ")
//
//let dateToday = DateFormatter()
//dateToday.dateFormat = "dd-MM-yyyy"// HH:mm"
//let str = dateToday.string(from: Date()).replacingOccurrences(of: "-", with: "/")
//
//
//
//let elapsedTime = Date()
//let hours = UInt(elapsedTime.timeIntervalSinceReferenceDate)/3600
//let hrsStr = String(hours)
//print(hrsStr)
//
//
//
//let value = "180"
//if let inteiro = Double(value) {
//    if -180.00...180.00 ~= inteiro {
//        print("Deu bom!")
//    } else {
//        print("Deu ruim")
//    }
//} else {
//    print("Deu ruim")
//}
//
//
//
//
//func getValidatedPrice(forPrice price: String) -> Double?{
//    if let oldPrice = Double(price){
//        let tmp = String(format: "%.2f", oldPrice)
//        return Double(tmp)!
//    } else {
//        // Meaning there is a problem
//        return nil
//    }
//}
//
//func getLatitudeFrom(sting str: String) -> String {
//    let latList = str.split(separator: ",")
//    let lat = latList[0]
//    return lat.replacingOccurrences(of: "(", with: "")
//}
//
//func getLongitureFrom(string str: String) -> String {
//    let longList = str.split(separator: ",")
//    let long = longList[1]
//    return long.replacingOccurrences(of: ")", with: "")
//}
//
//
//var myStr = "(latitude,longitude)"
//let latitude = getLatitudeFrom(sting: myStr)
//let longitude = getLongitureFrom(string: myStr)
//
//
//var myDict = Dictionary<String, String>()
//
//myDict["firstKey"] = "firstValue"
//
//if let a = myDict["baby"] {
//    print("yes!")
//} else {
//    print("no!")
//}



//let myst = "Moçambique - Florianópolis"
//myst.count - 13
//
//let authorizedUsers = [
//    "uijwVak444X5ydlVucsWssXf3EK2", // Miguel Medeiros
//    "83w1S3JjkNZCEeBA5bdIljYQ8gy1", // Miguel Rocha
//]
//
//authorizedUsers.contains("83w1S3JjkNZCEeBA5bdIljYQ8gy1")

//import UIKit
//import MapKit
//
//var myNSDict = [String: String]()
//
//myNSDict["key"] = "HR2RH9P8RHR2PO2R9032DFG876RF876TDC"
////myNSDict?.setValue("HR2RH9P8RHR2PO2R9032DFG876RF876TDC", forKey: "key")
//
//print(myNSDict)
//
//var cleanData = [String: Any]()
//
//cleanData["key"] = "98QYEH3983AEY78AG2L"
//
//let myOptional: String?
//myOptional = nil
//print(myOptional)

//if let unwrapped = (myOptional != nil) && myOptional != "" {
//    print("it is all fine!")
//} else {
//    print("Deu ruim!")
//}


func isValidEmailAddress(emailAddressString: String) -> Bool {
    
    var returnValue = true
    let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    
    do {
        let regex = try NSRegularExpression(pattern: emailRegEx)
        let nsString = emailAddressString as NSString
        let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
        
        if results.count == 0
        {
            returnValue = false
        }
        
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        returnValue = false
    }
    
    return  returnValue
}

let email = "msda@umich.edu"

isValidEmailAddress(emailAddressString: email)






