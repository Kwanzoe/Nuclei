//
//  menu.swift
//  problem2
//
//  Created by Kuarnjo Taid on 29/01/23.
//

import Foundation



class Menu: Utils{
    
    func menu() -> Options {
        
        print("""

    Choose from option 1 to 4 and press enter.

    1. Enter student details
    2. Display student data
    3. Enter roll number to delete
    4. Save
    5. Exit

    """
    )
        var optionEnumVal: Options
        
        let userOption = Int(readLine() ?? "0")

        switch userOption{
        case 1:
            optionEnumVal = Options.enterData
        case 2:
            optionEnumVal = Options.displayData
            
        case 3:
            optionEnumVal = Options.delete
        
        case 4:
            optionEnumVal = Options.saveData
        
        case 5:
            optionEnumVal = Options.exit
            
        default:
            optionEnumVal = Options.invalid
        }
        
        return optionEnumVal
    }
    
   
}
