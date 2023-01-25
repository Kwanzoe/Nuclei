//
//  protocol.swift
//  problem1
//
//  Created by Kuarnjo Taid on 24/01/23.
//

protocol ItemObject {
    var name: String {get set}
    var price: Double {get set}
    var type: String {get set}
    var quantity: Double {get set}
    
    func calcPrice()
    func display()
}
