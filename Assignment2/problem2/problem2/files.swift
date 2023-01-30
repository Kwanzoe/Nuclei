////
////  saveFile.swift
////  problem2
////
////  Created by Kuarnjo Taid on 27/01/23.
////
//
import Foundation

class Files: Essential {
    
    var userDict: [String:String]?
    
    init(userDict: [String : String]? = nil) {
        self.userDict = userDict
    }
    
    func save() {
        
        userDefaults.set(userDict, forKey: "Users")
        
    }
    
    func delete(key: String) {
        
        userDict?.removeValue(forKey: key)
        userDefaults.set(userDict, forKey: "Users")
    }
    
}
