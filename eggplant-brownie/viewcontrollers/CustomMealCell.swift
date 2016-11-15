import UIKit

class CustomMealCell:UITableViewCell {
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var hapinessField: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    func configure(_ meal:Meal){
        self.titleField.text = meal.name
        self.hapinessField.text = "\(meal.happiness)"
        self.selectionStyle = UITableViewCellSelectionStyle.none
        cardView.backgroundColor = UIColor.white
        cardView.layer.cornerRadius = 3.0
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 3);
        cardView.layer.shadowOpacity = 0.3
    }
    
}
