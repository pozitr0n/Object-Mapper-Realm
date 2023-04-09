//
//  ViewController.swift
//  ObjectMapperRealm-start
//
//  Created by Raman Kozar on 08.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkingButton(_ sender: UIButton) {
        
        Request.getData(type: Employee.self, success: {
            self.showAlert(title: "Customers", message: "Successfull fetched Customers")
        }, fail: { error in
            self.showAlert(title: "Customers", message: "Unsuccessfull fetched Customers\n\n\(error.description)")
            
        })
        
    }
    
    // метод, с помощью которого мы будем видеть ответ об успехе/неудаче записи наших данных в Realm
    
    func showAlert(title: String, message: String) -> Void {
        
        let actionSheetController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
            
        }
        
        actionSheetController.addAction(cancelAction)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    

}

