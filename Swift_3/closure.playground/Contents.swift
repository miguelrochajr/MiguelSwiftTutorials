struct Rectangle {
    var width = 1
    var height = 1
    
    func area() -> Int {
        return width*height
    }
    
    mutating func scaleBy(value: Int){
        width *= value
        height *= value
    }
}

var myRect = Rectangle(width: 100, height: 100)
myRect.scaleBy(value: 2)
