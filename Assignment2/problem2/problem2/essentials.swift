//
//  essentials.swift
//  problem2
//
//  Created by Kuarnjo Taid on 29/01/23.
//

import Foundation

class Essential {
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    var userDefaults = UserDefaults.standard
    
    func getUserDict() -> [String:String]{
        var userDict = userDefaults.object(forKey: "Users") as? [String:String] ?? [:]
        return userDict
    }
    
}
