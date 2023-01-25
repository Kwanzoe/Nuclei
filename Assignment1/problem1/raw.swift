//
//  raw.swift
//  problem1
//
//  Created by Kuarnjo Taid on 25/01/23.
//
class RawItem: ItemObject{
    
    var name: String
    var price: Double
    var type: String
    var quantity: Double
    var finalPrice: Double?
    
    init(name: String, price: Double, type: String, quantity: Double) {
        self.name = name
        self.quantity = quantity
        self.price = price * quantity
        self.type = type
        
    }
    
    func calcPrice() {
        self.finalPrice = price + price * 0.125
    }
    
    func display(){
        print("Item name: " + self.name)
        print("Item price: " + String(self.price))
        print("Tax liability: " + String(self.finalPrice! - self.price))
        print("Final price: " + String(self.finalPrice!))
    }
}
