import Foundation

class Meal {
    
    let name:String
    let happiness:Int
    let items:Array<Item>
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
        self.items = []
    }
    
    init(name:String, happiness:Int, items:Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness \(self.happiness)"
        for item in self.items {
            message += "\n\(item.name) - calories: \(item.calories)"
        }
        return message
    }
    
}
