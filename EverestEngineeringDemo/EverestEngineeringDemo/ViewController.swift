//
//  ViewController.swift
//  EverestEngineeringDemo
//
//  Created by Nethra on 13/03/24.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var wightTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        
        }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        if distanceTextField.text == "" || wightTextField.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Enter Details", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "DeliveryCostViewController") as! DeliveryCostViewController
            destinationVC.distance = self.distanceTextField.text!
            destinationVC.weight = self.wightTextField.text!
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    

        //Calls this function when the tap is recognized.
        @objc func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }

}

