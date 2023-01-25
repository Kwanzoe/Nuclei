//
//  main.swift
//  problem1
//
//  Created by Kuarnjo Taid on 23/01/23.
//

import problem1

enum InputError: Error{
    case invalidInput
}

func main() throws {

    var name: String
    var price: Double?
    var type: String
    var quantity: Double?
    var key: String = "y"
    var itemArr: [ItemObject] = []
    var itemFactoryObj = ItemFactory()
    
    while key.lowercased() != "q"{
        
        print("Name: ")
        name = readLine()!
        
        print("Price: ")
        price = Double(readLine()!)
        guard price != nil else{
            throw InputError.invalidInput
        }
        
        print("Type: ")
        type = readLine()!
        guard ItemType(rawValue: type) != nil else{
            throw InputError.invalidInput
        }
        type = type.lowercased()
        
        print("Quantity: ")
        quantity = Double(readLine()!)
        guard quantity != nil else{
            throw InputError.invalidInput
        }
        
        itemArr.append(itemFactoryObj.getItem(name: name, price: price!, type: ItemType(rawValue: type)!, quantity: quantity!))
        
        print("Do you wish to add more items? Press Y to continue or Q to quit")
        key = readLine()!
    }
    

    for item in itemArr {
        item.calcPrice()
        item.display()
    }

}

func run(){
    
    do{
        try main()
    }
    catch InputError.invalidInput{
        print("Inavlid input!")
        run()
    }
    catch{
        print(error)
    }
}
run()


