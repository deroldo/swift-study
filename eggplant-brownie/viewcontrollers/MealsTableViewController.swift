import UIKit

class MealsTableViewController:UITableViewController, AddAMealDeledate {
    
    var meals = [Meal(name:"Hamburger", happiness: 5),
                 Meal(name:"Pizza", happiness: 4),
                 Meal(name:"Salada", happiness: 1)]
    
    override func viewDidLoad() {
        if let savedMeals = SaveAsFileUtil().read(archiveName: "meals.data") {
            self.meals = savedMeals as! Array<Meal>
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    func add(_ meal:Meal){
        self.meals.append(meal)
        SaveAsFileUtil().save(self.meals, archiveName:"meals.data")
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(MealsTableViewController.showDatails))
        cell.addGestureRecognizer(longPressRecognizer)
        return cell
    }
    
    func showDatails(recognizer: UILongPressGestureRecognizer){
        if (recognizer.state == UIGestureRecognizerState.began){
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let meal = meals[indexPath.row]
                Alert(controller:self).action(title: meal.name, message: meal.details(), buttonLabel: "Remove",
                                              style: UIAlertActionStyle.destructive, handler: { action in
                                                self.meals.remove(at: indexPath.row)
                                                SaveAsFileUtil().save(self.meals, archiveName:"meals.data")
                                                self.tableView.reloadData()
                })
            }
        }
    }
    
}
