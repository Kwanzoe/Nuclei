////
////  user.swift
////  problem2
////
////  Created by Kuarnjo Taid on 25/01/23.
////
import Foundation

class User: Codable{
    
    var fullName: String
    var age: Int
    var address: String
    var rollNum: Int
    var courses: [String]
    
    
    init(fullName: String, age: Int, address: String, rollNum: Int, courses: [String]) {
        self.fullName = fullName
        self.age = age
        self.address = address
        self.rollNum = rollNum
        self.courses = courses
    }
    
}
