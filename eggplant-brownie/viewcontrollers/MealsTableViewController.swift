import UIKit

class MealsTableViewController:UITableViewController {
    
    var meals = [Meal(name:"Hamburger", happiness: 5),
                 Meal(name:"Pizza", happiness: 4),
                 Meal(name:"Salada", happiness: 1)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        return cell
    }
    
}
