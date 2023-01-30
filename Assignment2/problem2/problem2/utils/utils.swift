//
//  essentials.swift
//  problem2
//
//  Created by Kuarnjo Taid on 29/01/23.
//

import Foundation

class Utils {
    static let util = Utils()
    
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    var userDefaults = UserDefaults.standard
    
    
    func getUserDict() -> [String:String]{
        
        let userDict = userDefaults.object(forKey: "Users") as? [String:String] ?? [:]
        return userDict
    }
    
    func encode(userObject: User) -> String? {
        
        encoder.outputFormatting = .prettyPrinted
        
        do{
            let data = try encoder.encode(userObject)
            return String(data: data, encoding: .utf8)
        }
        catch{
            print(error.localizedDescription)
        }
    
        return nil
    }
    
    
    
    func decode(userDict: [String:String], key: String) -> User? {
                
        do{
            let user = try decoder.decode(User.self, from: userDict[key]!.data(using: .utf8)!)
            return user
        }
        catch{
            print(error.localizedDescription)
        }
        return nil
        
    }
}
