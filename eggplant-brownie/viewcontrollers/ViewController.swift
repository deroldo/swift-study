import UIKit

class ViewController:UIViewController {
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinnessField:UITextField?
    var mealsTable:MealsTableViewController?
    
    @IBAction func add(){
        if (nameField == nil
            || happinnessField == nil
            || mealsTable == nil){
            return
        }
        
        let name:String = nameField!.text!
        if let happiness = Int(happinnessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            mealsTable!.add(meal)
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
        }
    }

}

