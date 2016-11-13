import UIKit

class ViewController:UIViewController, UITableViewDataSource {
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinnessField:UITextField?
    var delegate:AddAMealDeledate?
    
    var items = [Item(name: "Carne", calories: 100),
                 Item(name: "Pão", calories: 75)]
    
    @IBAction func add(){
        if (nameField == nil
            || happinnessField == nil
            || delegate == nil){
            return
        }
        
        let name:String = nameField!.text!
        if let happiness = Int(happinnessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            delegate!.add(meal)
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = items[row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

}

