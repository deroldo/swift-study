import UIKit

class ViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinnessField:UITextField?
    @IBOutlet var tableView: UITableView!
    var delegate:AddAMealDeledate?
    
    let archiveName = "items.data"
    
    var items = [Item(name: "Carne", calories: 100),
                 Item(name: "Pão", calories: 75),
                 Item(name: "Queijo", calories: 110),
                 Item(name: "Alface", calories: 10),
                 Item(name: "Tomate", calories: 15),
                 Item(name: "Molho", calories: 145)]
    
    var selected = Array<Item>()
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
        if let savedItems = SaveAsFileUtil().read(archiveName: archiveName) {
            self.items = savedItems as! Array<Item>
        }
    }
    
    func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
          navigation.pushViewController(newItem, animated: true)
        }
    }
    
    @IBAction func add(){
        if let meal = getMealFromForm() {
            delegate?.add(meal)
            navigationController!.popViewController(animated: true)
        } else {
            Alert(controller: self).show(title: "Ops!", message: "Todos os campos são obrigatórios")
        }
    }
    
    func convertToInt(_ text:String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func getMealFromForm() -> Meal?{
        if let name = nameField?.text {
            if let happiness = convertToInt(happinnessField?.text){
                return Meal(name: name, happiness: happiness, items: selected)
            }
        }
        return nil
    }
    
    func add(_ item: Item) {
        items.append(item)
        SaveAsFileUtil().save(items, archiveName: archiveName)
        if let table = tableView {
            table.reloadData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType == UITableViewCellAccessoryType.none) {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                selected.append(items[indexPath.row])
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
                if let position = selected.index(of: items[indexPath.row]) {
                    selected.remove(at: position)
                }
            }
        }
    }

}

