//
//  main.swift
//  problem1
//
//  Created by Kuarnjo Taid on 23/01/23.
//

struct items {
    
    var name: String
    var price: Double
    var type: String
    var quantity: Int
    var finalPrice: Double = 0
    
    mutating func calcPrice() {
        
        price = price * Double(quantity)
        
        // Used in case "imported"
        var preFinalPrice: Double
        
        switch type.lowercased() {
        
        case "raw":
            finalPrice = price + 0.125 * price
            
        case "manufactured":
            // finalPrice = (price + 0.125 * price) + 0.02 * (price + 0.125 * price)
            finalPrice = 1.02 * (price + 0.125 * price)
            
        case "imported":
            
            preFinalPrice = price + 0.125 * price + 0.1 * price
            if preFinalPrice <= 100{
                finalPrice = preFinalPrice + 5
            }
            else if preFinalPrice > 100 && preFinalPrice <= 200{
                finalPrice = preFinalPrice + 10
            }
            else{
                finalPrice = preFinalPrice + 0.05 * preFinalPrice
            }
        default:
            print("Unidentified type")
        }
        
        
    }
        
    // Display function
    func display() -> Void {
        print("Item name: " + name)
        print("Item price: " + String(price))
        print("Tax liability: " + String(finalPrice - price))
        print("Final price: " + String(finalPrice))
    }
}

var name: String = ""
var price: Double = 0.0
var type: String = ""
var quantity: Int = 0
var key: String = ""
var itemArr = [[Any]]()


while key.lowercased() != "q"{
    print("Name: ")
    name = readLine()!
    print("Price")
    price = Double(readLine()!)!
    print("Type: ")
    type = readLine()!
    print("Quantity: ")
    quantity = Int(readLine()!)!
    
    itemArr.append([name, price, type, quantity])
    
    print("Do you wish to add more items? Press Q to quit or enter key to continue")
    key = readLine()!
}


for item in itemArr{
    var item = items(name: item[0] as! String, price: item[1] as! Double, type: item[2] as! String, quantity: item[3] as! Int)

    item.calcPrice()
    item.display()
}

