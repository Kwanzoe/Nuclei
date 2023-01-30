////
////  encoder.swift
////  problem2
////
////  Created by Kuarnjo Taid on 27/01/23.
////
//
import Foundation

class Encoder: Essential {
    
    var userObject: User
    
    init(userObject: User) {
        self.userObject = userObject
    }
    
    func encode() -> String? {
        
        
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
}
