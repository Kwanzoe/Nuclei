//
//  main.swift
//  problem1
//
//  Created by Kuarnjo Taid on 23/01/23.
//

import problem1


enum InputError: Error{
    case inputError
}

func main() {

    var name: String
    var price: Double
    var type: String
    var quantity: Double
    var key: String = "y"
    var itemArr: [Item] = []
   
    
    while key.lowercased() != "q"{
        print("Name: ")
        name = readLine()!
        print("Price: ")
        price = Double(readLine()!) ?? 0.0
        print("Type: ")
        type = readLine()!
        print("Quantity: ")
        quantity = Double(readLine()!) ?? 0
        
        itemArr.append(Item(name: name, price: price, type: type, quantity: quantity))
        
        print("Do you wish to add more items? Press Y to continue or Q to quit")
        key = readLine()!
    }
    

    for item in itemArr {
        item.calcPrice()
        item.display()
    }

}


main()
