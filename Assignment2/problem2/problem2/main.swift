//
//  main.swift
//  problem2
//
//  Created by Kuarnjo Taid on 25/01/23.
//
import Foundation

func main(){

    // creating menu instance
    let menuObj = Menu()

    // getting the users data dictionary
    var userDict = Utils.util.getUserDict()

    // menu operations instance
    let operationObj = Operate()

    // Enum for option selected
    var optionEnumVal: Options = .invalid


    // Running the Menu

    repeat{
        optionEnumVal = menuObj.menu()

        if optionEnumVal == .exit{
            break
        }
        else {
            switch optionEnumVal{

            case .enterData:
                do{
                    let userObj = try operationObj.enterData()
                    userDict[String(userObj.rollNum)] = Utils.util.encode(userObject: userObj)
                }
                catch InputError.invalidInput{
                    print("\nEnter proper input!")
                    continue
                }
                catch{
                    print(error.localizedDescription)
                    continue
                }
                
            case .displayData:
                operationObj.displayData(userDict: userDict)

            case .delete:
                operationObj.deleteData(userDict: &userDict)

            case .saveData:
                operationObj.saveData(userDict: userDict)

            case .invalid:
                print("Invalid option")
                continue

            default:
                print("Exiting")
            }
        }

    } while optionEnumVal != .exit


}


main()


