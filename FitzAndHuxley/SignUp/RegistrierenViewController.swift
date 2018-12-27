//
//  RegistrierenViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 17.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class RegistrierenViewController: UIViewController {
    
    @IBOutlet weak var vornameTextfield: UITextField!
    @IBOutlet weak var nachnameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwort1Textfield: UITextField!
    @IBOutlet weak var passwort2Textfield: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func shouldPerformSegue(withIdentifier: String, sender: Any?) -> Bool {
                
                if (vornameTextfield.text != "" && nachnameTextfield.text != "" &&
                    emailTextfield.text != "" &&
                    passwort1Textfield.text != "" && passwort2Textfield.text != ""){
                    defaults.setValue(vornameTextfield.text, forKey: "vorname")
                    defaults.setValue(nachnameTextfield.text, forKey: "nachname")
                    defaults.setValue(emailTextfield.text, forKey: "email")
                    
                    return true
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Fehler", message: "Ihre Eingabefehler sind leer", preferredStyle: .alert)
                    
                    let back = UIAlertAction(title: "Zurück", style: UIAlertAction.Style.cancel)
                    
                    alertController.addAction(back)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    return false
                    
                }
        
        }
    }





