//
//  main.swift
//  Grammer
//
//  Created by Tony Willsung on 2016/10/14.
//  Copyright © 2016年 Tony Willsung. All rights reserved.
//

import Foundation

// for 循环
for i in 0...10 {
    print(i)
}

let strings = ["apple", "box", "cat", "dig"]
for string in strings {
    print("当前string: \(string)")
    for char in string.characters {
        print("这个string包含: \(char)")
    }
}

// switch - case
let point = (1, -1)
switch point {
case (0, 0) :
    print("原点")
case (_, 0):
    print("x轴")
case (0, _):
    print("y轴")
case let (x, y) where x == y, let (x, y) where x == -y:
    print("对角线")
default :
    print("在坐标内")
}

// func 函数使用
func sum(a:Int, b:Int) -> Int {
    return a + b
}
print(sum(a: 1, b: 5))
// func 函数使用
func levA(A a:Int, B b:Int) -> String {
    func levB(c:Int, d:Int) -> Int {
        return c + d
    }
    let result = levB(c:a, d:b)
    return "Int2String: \(a) + \(b) = \(result)"
}
print(levA(A: 34, B: 7))

//可变参数个数的函数定义
func sum(nums:Double...) ->Double {
    var result:Double = 0
    for num in nums {
        result += num
    }
    return result
}
print(sum(nums: 1,2,3,4))
print(sum(nums: 1,2,3))
print(sum())

//函数作为参数
func total(sum: (Double...) -> Double, a:inout Double, b:inout Double) -> Double {
    func sumUpTo ( aa:inout Double, bb:inout Double){
        aa += 1
        bb += 1
    }
    sumUpTo(aa: &a, bb: &b)
    print("a: \(a), b: \(b)")
    return sum(a,b)
}
var argA:Double = 3
var argB:Double = 5
print(total(sum: sum, a: &argA, b: &argB))

//class 类定义及使用
//父类
class User {
    var name:String = ""
    var age:Int = 0
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    func getAge() -> Int {
        return self.age
    }
    func setAge(age:Int) {
        self.age = age
    }
    
    func toString() -> String {
        return "父类：\(self.name) 的年龄 \(self.age)"
    }
    func getGrade(math: Double, chinese: Double, english: Double) -> Double {
        var result:Double = 0
        result = math + chinese + english
        return result
    }
}
//子类
class theUser: User {
    override func toString() -> String {
        return "子类：\(self.name) 的年龄 \(self.age)"
    }
}
var user = User(name: "Chaly", age: 24)
let string = user.toString()
let grade = user.getGrade(math: 90, chinese: 96.5, english: 80.5)
print("\(string)的总分数：\(grade)")
var subUser = theUser(name: "Buby", age:4)
var subUserString = subUser.toString()
var subUserGrade = subUser.getGrade(math: 98.5, chinese: 74, english: 85)
print("\(subUserString)的总分数：\(subUserGrade)")

// 枚举
enum Students {
    case Lily, Bob, Ruby, Key, Goofy
    
    func toString() -> String {
        switch self {
        case .Lily:
            return "这是Lily"
        case .Bob:
            return "这是Bob"
        case .Ruby:
            return "这是Ruby"
        case .Key:
            return "这是Key"
        case .Goofy:
            return "这是Goofy"
        }
    }
}
var member = Students.Lily
//注意 ：前面指定过结构体之后，后续操作结构体内元素可以直接使用.Goofy的形式
member = .Goofy
print(member.toString())
print(member.hashValue)
//print(Student.getRawValue(member))

//学生结构体
struct Student {
    var name:String
    var age:Int
}
//班级结构体
struct MiddleClass {
    var name = "一班"
    var number = 40
    
    func toString() -> String {
        return "\(self.name) 有 \(self.number) 人"
    }
}
//扩展前调用
var midClass = MiddleClass()
print(midClass.toString())
//对班级结构体进行扩展
extension MiddleClass {
    mutating func addNewStudent(students:[Student]) {
        self.number = self.number + students.count
    }
}
//扩展后调用
var largeClass = MiddleClass()
var studentA = Student(name:"A", age:20)
var studentB = Student(name:"B", age:21)
var studentC = Student(name:"C", age:22)
largeClass.addNewStudent(students: [studentA, studentB, studentC])
print(largeClass.toString())








