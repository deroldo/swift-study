import UIKit

class ViewController:UIViewController {
    
    @IBOutlet var nameField:UITextField?
    
    @IBOutlet var happinnessField:UITextField?
    
    @IBAction func add(){
        if (nameField == nil || happinnessField == nil){
            return
        }
        
        let name:String = nameField!.text!
        if let happiness = Int(happinnessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            print("eaten \(meal.name) \(meal.happiness)")
        }
    }

}

