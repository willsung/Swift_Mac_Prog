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
let point = (0, 0)
switch point {
case (0, 0) :
    print("原点")
case (_, 0):
    print("x轴")
case (0, _):
    print("y轴")
case let (x, y) where x == y :
    print("第一对角线")
case let (x, y) where x == -y :
    print("第二对角线")
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







