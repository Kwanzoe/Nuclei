//
//  decoder.swift
//  problem2
//
//  Created by Kuarnjo Taid on 29/01/23.
//

import Foundation

class Decoder {
    
    var userDict: [String:String]?
    var key: String
    
    init(userDict: [String : String]? = nil, key: String) {
        self.userDict = userDict
        self.key = key
    }
    
    func decode() -> User? {
        
        let jsonDecoder = JSONDecoder()
        
        do{
            var user = try jsonDecoder.decode(User.self, from: userDict![key]!.data(using: .utf8)!)
            
            return user
        }
        catch{
            print(error.localizedDescription)
        }
        
        return nil
        
//        return User(fullName: "N/A", age: 0, address: "N/A", rollNum: -1, courses: ["N/A", "N/A", "N/A", "N/A"])
    }
    
}
