//: Playground - noun: a place where people can play

import UIKit

var str: String = "Hello, playground"
let abc: Int = 1234

// 범위 연산자
1...5 // 1,2,3,4,5,
1..<5 // 1,2,3,4
// 1>..5 (x)

for i in 1...5 {
    print(i)
}


for _ in 1...5 {
    print("hello world")
    // 루프상수를 사용하지 않을 때는 언더바로 표가능
}

// while
var n = 1
while n < 10 {
    n = n+1
    print(n)
}

repeat {
    print(n)
    n = n+1
} while n < 20

// if
let adultAge = 19
let age = 20
if age < adultAge{
    print("you are not adult")
}


// switch
switch age{
    case 1...18: print("you are no adult")
    case 19: print("hello world")
    default: print("you are adult")
}

// 배열
var cities = ["Seoul", "LA", "Tokyo"]
var temp = [1,2,4]
for city in cities {
    print(city)
}

var list = [String]()
list.append("hello")
list.append("world")
list.insert("swift", at: 1)

print(list)

// Set
var genre: Set = ["Clasic", "Rock"]
genre.insert("test")

// Tuple 
let myTuple = ("a", "b","1")
myTuple.0

let (aa, bb, cc) = myTuple
aa


// Dictionary
var capital = ["kr": "seoul", "en":"english"]
capital["kr"]

var capital2 = [String: String]()
capital2["kr"] = "서울"
capital2.updateValue("런던", forKey: "en")
capital2

for row in capital2 {
    print(row)
}

for (_, value) in capital2{
    print(value)
}


// Optional
var myVal: Int?
if myVal != nil {
    myVal = myVal! + 5
}
//print(myVal)

// optional binding
if var myVal2 = myVal {
    print(myVal2)
}
print(myVal)


let optInt = Int("1234")
if optInt != nil {
    if optInt == 123 {
        print("value is 123")
    }else{
        print("value is not 123")
    }
}

// 함수
func sayHello(name: String)->Int{
    print("hello \(name)")
    return 0
}
sayHello(name: "swift")

// 외부 매개변수
func sayHello2(studentName name: String){
    print("hello \(name)")
}
sayHello2(studentName: "swift")

func sayHello3(_ name:String){
    print("hello \(name)")
}

sayHello3("swift")

// 함수특성1 : 변수나 상수에 함수를 할당할 수 있음
func myFunc(base: Int)->String{
    return "result is \(base+1)"
}
myFunc(base: 5)
let f = myFunc
f(10)

// 함수특성2 : 함수의 반환타입으로 함수를 사용할 수 있음
func myFunc2()->String{
    return "This is myFunc2"
}
func myFunc3()->()->String{
    return myFunc2
}
let f2 = myFunc3()
f2()

// 함수특성3 : 함수의 매개변수로 함수를 사용할 수 있음
func myFunc4(base:Int)->Int{
    return base+1
}
func myFunc4a(base:Int)->Int{
    return base*10
}
func myFunc5(base: Int, varFunc: (Int)->Int)->Int{
    return varFunc(base)
}
myFunc5(base: 10, varFunc: myFunc4a)

// 함수 중첩
func outterFunc(base:Int)->(Int)->String{
    let value = base + 20
    func innerFunc(inc:Int)->String{
        return "\(inc+value) 를 반환"
    }
    
    return innerFunc
}

let f3 = outterFunc(base: 10)

f3(10)
f3(100)
f3(1000)


// Closure
let f4 = {(base:Int) -> (Int) in
    return base+1
}

f4(10)


({ (base:Int)->Int in
    return base+1
})(100)

// 클로저 표현식과 경량문법
var valueArray = [1,8,5,7,2,3]
valueArray.sort{ (s1: Int, s2:Int) -> Bool in
    if s1 > s1 {
        return true
    }else {
        return false
    }
    
    // 비교연산자는 기본적으로 true / false 를 리턴하므로 한 줄로 쓸 수 있다
    // return sq>s1
}

// 추론가능할 시 더욱 생략 가능
valueArray.sort{ (s1, s2) in return s1>s2}
valueArray.sort { $0 > $1 }

// struct는 초기화 구문이 자동으로 만들어지는데
// property는 무조건 초기화 구문을 만들어줘야 한다
//struct
struct MyStruct{
    var myVal = 10
}

struct MyRect{
    var originX: Double
    var originY = 0.0
    var sizeX = 0.0
    var sizeY = 0.0
    var centerX: Double{
        return originX + (sizeX/2)
    }
    
    var centerY: Double{
        get{
            return originY + (sizeY / 2 )
            
        }
        
        set (newValue){
             originY = newValue - (sizeY / 2)
            
        }
    }
}

var rect = MyRect(originX: 0.0, originY: 0.0, sizeX: 10.0, sizeY: 10.0)
rect.centerX
rect.originX = 4.0
rect.centerY = 100.0


// 프로퍼티 옵저버
struct Job{
    var income: Int = 0 {
        willSet{
            print("new income is \(newValue)")
        }
        didSet{
            print("income increased \(income - oldValue)")
        }
    }
}
var job = Job(income: 100)
job.income = 120

// 타입 프로퍼티 / 타입 메서드
class MyTypeClass {
    static var value: Int = 10
    static var value2: Int {
       return 100
    }
    
    func sayHello() {
        print("hello world")
    }
    class func sayHelloTypeFunc() {
        print("hello type function")
    }
}

MyTypeClass.value
MyTypeClass.sayHelloTypeFunc()


// 상속
class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "move \(currentSpeed)"
    }
}

class Bicycle: Vehicle{
    var hasBasket = false
    
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 20.0
print("bicycle : \(bicycle.description)")

// 프로퍼티 재정의(override)
class Car: Vehicle{
    var gear = 0
    var engineLevel = 0
    override var currentSpeed: Double{
        get{
            return Double(engineLevel*50)
        }
        set{ }
    }
}

let car = Car()
car.currentSpeed = 100.0
print(car.currentSpeed)

// 타입 비교 / 캐스팅
let vehicle: Vehicle
// java 에서는 vehicle = bicycle as Vehicle
vehicle = bicycle as Vehicle

let car1 = vehicle as? Bicycle

// 클래스 초기화
class Resolution{
    var width: Int
    var height = 0 //: Int
    var depth = 0
    init(width: Int) {
        self.width = width
    }
    //    init(width: Int, height: Int){
    //
    //    }
}
let res = Resolution(width: 100)
class Resolution2: Resolution{
    override init(width: Int){
        super.init(width: width)
    }
}

// 옵셔널 체인
struct Human{
    var name: String?
    var isMan: Bool
}
struct Company{
    var ceo: Human?
    var companyName: String?
}
var boy:Human? = Human(name: "john", isMan: true)
var myCompany: Company? = Company(ceo: boy, companyName: "myCompany")


if myCompany != nil {
    if myCompany!.ceo != nil {
        if myCompany!.ceo!.name != nil {
            print("hello \(myCompany!.ceo!.name!)")
        }
    }
}

if let company = myCompany {
    if let ceo = company.ceo {
        if let name = ceo.name {
            print("hello \(name)")
        }
    }
}

if let name = myCompany?.ceo?.name {
    print("hello \(name)")
}
print(myCompany?.ceo?.isMan) // Optional(true)



// 열거형 ( enum )
enum Direction{
    case North
    case South
    case East, West
}
var dir = Direction.North
dir = .East

enum HTTPCode: Int{
    case OK = 200
    case NOT_MODIFY = 304
    case NOT_FOUND = 404
    case SERVER_ERROR = 500
    
    var value: String{
        return "HTTP number is \(rawValue)"
    }
    func getDescription()->String{
        switch self {
        case .OK:
            return "success HTTPCode is \(rawValue)"
        default:
            return "not match"
        }
    }
}
print(HTTPCode.OK.rawValue)
print(HTTPCode.OK.getDescription())



