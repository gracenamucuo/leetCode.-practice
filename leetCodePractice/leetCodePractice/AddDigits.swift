//
//  AddDigits.swift
//  leetCodePractice
//
//  Created by 戴运鹏 on 2019/3/10.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation


/// 将给定的一个非负整数的所有位数的数字相加，直到结果为个位数为止

func addDigits(_ num:Int) -> Int {
    guard num >= 0 else {
        return -1
    }
    
    if num < 10 {
        return num
    }
    
    func recursionAdd(_ a:Int) -> Int {
        var temp = a
        while temp >= 10 {
            let str = String(temp)
            temp = str.reduce(0) { (intial, element)  in
                intial + (Int(String(element)) ?? 0)
            }
        }
        return temp
    }
    
    return recursionAdd(num)
}
let a = addDigits(999999999)


func addDigits2(_ a:Int) -> Int {
    guard a > 0 else {
        return 0
    }
    
    if a % 9 == 0 {
        return 9
    }else{
        return a % 9
    }
    
}

