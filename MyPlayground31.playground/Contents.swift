import UIKit

enum Gender: Int {
    case male=0,female
}

internal class Person: Equatable, CustomStringConvertible {
    internal var description: String {
        return "name:\(name),gender:\(gender)"
    }
    
    private func hello() {
        print("Hello world!")
    }
    internal func say() {
        hello()
    }
    private(set) var name: String
    internal var gender: Gender
    var fullName: String {
            return "little \(name)"
    }
    init(name:String,gender:Gender) {
        self.name = name
        self.gender = gender
    }
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.gender == rhs.gender
    }
    
    subscript(x:Int, y:Int) -> Int {
        return x*y
    }
    
}

let p1 = Person(name: "lgy", gender: .male)
let p2 = Person(name: "gyx", gender: .female)
//print(p1.name)
////p1.name = "ssss"
//
//p1.say()

p1[29,3]
p1 === p2
p1 == p2
print(p1)
print(p2)

class Student: Person{
}

class Teacher: Person {
    
}

let s1 = Student(name: "fxk", gender: .male)
let t1 = Teacher(name: "yd", gender: .female)
let t2 = Teacher(name: "tb", gender: .male)

var persons = [p1,p2,s1,t1,t2]

var dict = ["person":0,"student":0,"teacher":0]

for p in persons {
    if p is Person {
        if let num = dict["person"] {
            dict["person"] = num + 1
        }
    }
    if p is Student {
        if let num = dict["student"] {
            dict["student"] = num + 1
        }
    }
    if p is Teacher {
        if let num = dict["teacher"] {
            dict["teacher"] = num + 1
        }
    }
}

print(dict)

var sorted = persons.sorted { (p1, p2) -> Bool in
    if p1.gender.rawValue < p2.gender.rawValue {
        return true
    }else if p1.name > p2.name && p1.gender == p2.gender {
        return true
    }
    return false
}
print(sorted)


var weather = ["weather":["cities":[["name":"chengdu","temp":30],["name":"chongqing","temp":35]]]]

//if let w = weather["weather"] {
//    if let cities = w["cities"] {
//        let chongqing = cities[1]
//        if let temp = chongqing["temp"] {
//            print(temp)
//        }
//    }
//}

func temperature() {
    guard let w = weather["weather"] else {
        return
    }
    guard let cities = w["cities"] else {
        return
    }
    let chongqing = cities[1]
    guard let temp = chongqing["weather"] else {
        return
    }
    print (temp)
    
}
