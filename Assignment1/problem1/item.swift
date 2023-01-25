import problem1


class Item: creator {
    
    var name: String
    var price: Double
    var type: itemType
    var quantity: Double
    var finalPrice: Double?
    
    init(name: String, price: Double, type: String, quantity: Double) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = itemType.unidentified
        
        switch type.lowercased(){
        case "raw":
            self.type = itemType.raw(self.price * self.quantity)
        
        case "manufactured":
            self.type = itemType.manufactured(self.price * self.quantity)
        
        case "imported":
            self.type = itemType.imported(self.price * self.quantity)
            
        default:
            print("Type is invalid. Sabotaging final price calculation")
        }
    }
    
    func calcPrice() {
        
        self.finalPrice = self.type.calc()
        
    }
        
    // Display function
    func display() -> Void {
        print("Item name: " + self.name)
        print("Item price: " + String(self.price))
        print("Tax liability: " + String(self.finalPrice! - self.price))
        print("Final price: " + String(self.finalPrice!))
    }
}
