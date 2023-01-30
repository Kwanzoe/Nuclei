//
//  readFile.swift
//  problem2
//
//  Created by Kuarnjo Taid on 29/01/23.
//

import Foundation

class Read: Essential {
    
    
    func readWhole() -> [String:String]? {
        
        var userDict: [String:String] = getUserDict()
       
        
        return userDict
        
    }
    
    func readOne(key: String) -> User? {
        
        var userDict: [String:String] = getUserDict()
        
        do{
            if userDict.contains(where: { $0.key == key }){
                
                let user = try decoder.decode(User.self, from: userDict[key]!.data(using: .utf8)!)
                
                return user

            }
        }
        catch{
            print(error.localizedDescription)
        }
        
        return nil
    }
    
}
