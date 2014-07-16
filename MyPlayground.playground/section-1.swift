// Playground - noun: a place where people can play

import Cocoa
// Basic opperations
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

let label = "The width is"
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples+oranges) pieces of fruits."

let anotherFloat: Float = 6.547
let myName = "Niranjan"
let myMessage = "Hello \(myName). Your lucky number is \(explicitFloat*anotherFloat). "

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
 shoppingList[1] = "bottle of water"
 
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

occupations["Jaynee"] = "Public Relations"

let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()

shoppingList = []

// Conditionals

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else{
        teamScore += 1
    }
}
teamScore

var optionalString: String? = "Hello"
optionalString == nil
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}


let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
    
}


let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
var numberKind = " "
for(kind, numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
            numberKind = kind
        }
    }
}
largest
numberKind


var n = 2
while n < 100 {
    n = n*2
}
n

var m = 2
do {
    m = m*2
} while m < 100
m

var firstForLoop = 0
for i in 0..<3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i=0; i < 3; ++i{
    secondForLoop += 1
}
secondForLoop

func greet(name: String, lunch: String) -> String {
    return "Hello \(name), today's lunch special is  \(lunch)."
}
greet("Bob", "mo:mo")

func getGasPrices() -> (Double, Double, Double){
    return (3.59, 3.69, 3.79)
}

getGasPrices()

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
    
}
sumOf()
sumOf(42, 597, 12)

//func averageOf(numbers: Int...) -> Float{
   // var average =  sumOf(numbers.append())/numbers.length
  //  }
//}

func returnFifteen() -> Int{
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> (Int -> Int){
    func addOne(number: Int) -> Int{
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)


func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool
{
    for item in list{
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool{
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

numbers.map({
    (number: Int) -> Int in
    if number % 2 != 0{
        return 0
    }
    else{
        return number
    }

})

class Shape{
    var numberOfSides = 0
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
    let constantProperty = 1
    func constantDescription() -> String
    {
        return " A shape with \(constantProperty) side."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescritpion() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescritpion() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

class Circle: NamedShape{
    var radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        return radius * M_PI
    }
    
    override func simpleDescritpion() -> String {
        return " A circle with radius \(radius)."
    }
}

let test = Circle(radius: 5.2, name: "my test square")
test.area()
test.simpleDescritpion()

class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
    }
    override func simpleDescritpion() -> String {
        return "An equilateral triangel with sides of lenth \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter

triangle.perimeter = 9.9

triangle.sideLength

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    willSet {
        square.sideLength = newValue.sideLength
    }
    }
    var square: Square{
    willSet {
        triangle.sideLength = newValue.sideLength
    }
    }
    init (size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
        
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")

triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength

triangleAndSquare.square = Square(sideLength: 50, name: "Larger square")
triangleAndSquare.triangle.sideLength

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int){
        count += amount * times
    }
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)


let opetionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = opetionalSquare?.sideLength

enum Rank: Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpelDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
            
       }
    }
}
let ace = Rank.Ace
ace


func CompareRank(first: String, second: String) -> String {
    firstCard = first.toRaw()
    SecondCard = second.toRaw()
    if firstCard || secondCard == 1 {
        return "Ace is the heighest"
    }
    else {
        if firstCard > secondCard {
            return "\(first) is the heighest."
        }
        else {
            return "\(second) is the heighest."
        }
        
    }
}











































