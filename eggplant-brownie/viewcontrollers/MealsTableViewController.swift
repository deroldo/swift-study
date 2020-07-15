import UIKit

class MealsTableViewController:UITableViewController, AddAMealDeledate {
    
    var meals = Array<Meal>()
    
    let archiveName = "meals.data"
    
    override func viewDidLoad() {
        if let savedMeals = SaveAsFileUtil().read(archiveName: self.archiveName) {
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
        SaveAsFileUtil().save(self.meals, archiveName: self.archiveName)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMealCell", for: indexPath) as! CustomMealCell
        let row = indexPath.row
        let meal = meals[row]
        cell.configure(meal)
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(MealsTableViewController.showDatails))
        cell.addGestureRecognizer(longPressRecognizer)
        return cell
    }
    
    @objc func showDatails(recognizer: UILongPressGestureRecognizer){
        if (recognizer.state == UIGestureRecognizerState.began){
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let meal = meals[indexPath.row]
                showDetails(meal: meal, row: indexPath.row)
            }
        }
    }
    
    func showDetails(meal:Meal, row:Int){
        Alert(controller:self).action(title: meal.name, message: meal.details(), buttonLabel: "Remove",
                                      style: UIAlertActionStyle.destructive, handler: { action in
                                        self.meals.remove(at: row)
                                        SaveAsFileUtil().save(self.meals, archiveName:"meals.data")
                                        self.tableView.reloadData()
        })
    }
    
}
