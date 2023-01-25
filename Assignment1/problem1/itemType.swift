
enum itemType {
    
    case raw(Double)
    case manufactured(Double)
    case imported(Double)
    case unidentified
    
    func calc() -> Double {
        
        var importedPrice: Double
        
        switch self{
            
        case let .raw(price):
            return price + price*0.125
            
        case let .manufactured(price):
            return 1.02 * (price + 0.125*price)
            
        case let .imported(price):
            
            importedPrice = price + price * 0.125 + 0.1 * price
            
            if importedPrice <= 100{
                return importedPrice + 5
            }
            else if importedPrice > 100 && importedPrice <= 200{
                return importedPrice + 10
            }
            else{
                return importedPrice + 0.05 * importedPrice
            }
        case .unidentified:
            return 0.0
        }
        
    }
        

    
}
