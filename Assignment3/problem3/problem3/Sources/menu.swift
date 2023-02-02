//
//  menu.swift
//  problem3
//
//  Created by Kuarnjo Taid on 02/02/23.
//

import Foundation

class Menu {
    
    func menu() -> MenuOptions {
          
          print("""
      Choose from option 1 to 4 and press enter.
      1. Add node
      2. Add dependency
      3. Get immediate parent nodes
      4. Get immediate children nodes
      5. Get ancestors
      6. Get descendants
      7. Delete dependency
      8. Delete node
      9. Show all dependencies
      10. Exit
      """
      )
          var optionEnumVal: MenuOptions
          
          let userOption = Int(readLine() ?? "0")

          switch userOption{
          case 1:
              optionEnumVal = MenuOptions.add
          case 2:
              optionEnumVal = MenuOptions.addDependency
              
          case 3:
              optionEnumVal = MenuOptions.parents
          
          case 4:
              optionEnumVal = MenuOptions.children
          
          case 5:
              optionEnumVal = MenuOptions.ancestors
          case 6:
              optionEnumVal = MenuOptions.descendants
          case 7:
              optionEnumVal = MenuOptions.deleteDependency
          case 8:
              optionEnumVal = MenuOptions.deleteNode
          case 9:
              optionEnumVal = MenuOptions.exit
          case 10:
              optionEnumVal = MenuOptions.showAllDependencies
          default:
              optionEnumVal = MenuOptions.invalid
          }
          
          return optionEnumVal
      }
      
}
