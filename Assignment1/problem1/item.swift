

class ItemFactory{
    
    func getItem(name: String, price: Double, type: ItemType, quantity: Double) -> ItemObject {
        switch type{
        case .raw:
            return RawItem(name: name, price: price, type: type.rawValue, quantity: quantity)
        case .manufactured:
            return ManufacturedItem(name: name, price: price, type: type.rawValue, quantity: quantity)
        case .imported:
            return ImportedItem(name: name, price: price, type: type.rawValue, quantity: quantity)
        
        }
    }
}
