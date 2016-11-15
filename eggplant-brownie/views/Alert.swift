import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(title:String = "Ops", message:String = "Houve um erro inesperado!"){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        self.controller.present(alert, animated: true, completion: nil)
    }
    
    func action(title:String, message:String, buttonLabel:String = "Ok",
                style:UIAlertActionStyle = UIAlertActionStyle.cancel, handler: (@escaping (UIAlertAction) -> Swift.Void)){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancel)
        let buttonAction = UIAlertAction(title: buttonLabel, style: style, handler: handler)
        alert.addAction(buttonAction)
        self.controller.present(alert, animated: true, completion: nil)
    }
    
}
