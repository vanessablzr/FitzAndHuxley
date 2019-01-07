//
//  LogInViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 14.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit
import Foundation

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwortTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//    Erstellen eines StandardUsers
         UserDefaults.standard.set("User", forKey: "vorname")
        UserDefaults.standard.set("User", forKey: "nachname")
        UserDefaults.standard.set("user@user.de", forKey: "email")
        UserDefaults.standard.set("123", forKey: "passwort")
        UserDefaults.standard.set("Userstrasse", forKey: "lieferStrasse")
        UserDefaults.standard.set("1", forKey: "lieferNr")
        UserDefaults.standard.set("Userstadt", forKey: "lieferStadt")
        UserDefaults.standard.set("12345", forKey: "lieferPlz")
        UserDefaults.standard.set("Userstrasse", forKey: "rechnungStrasse")
        UserDefaults.standard.set("1", forKey: "rechnungNr")
        UserDefaults.standard.set("Userstadt", forKey: "rechnungStadt")
        UserDefaults.standard.set("12345", forKey: "rechnungPlz")
        UserDefaults.standard.set("User User", forKey: "kartenInhaber")
        UserDefaults.standard.set("1234123412341234", forKey: "kartenNr")
        UserDefaults.standard.set("12.23", forKey: "kartenDatum")
        UserDefaults.standard.set("123", forKey: "kartenCvv")
    }
    
    
    @IBAction func pressAnmelden(_ sender: Any) {
        func shouldPerformSegue(withIdentifier: String, sender: Any?) -> Bool {
            if (emailTextfield.text == UserDefaults.standard.string(forKey: "email") && passwortTextfield.text == UserDefaults.standard.string(forKey: "passwort")){
                return true
                
            } else {
                let alert = UIAlertController(title: "Fehler", message: "Die Email stimmt nicht mit dem Passwort überein", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "Zurück", style: .default, handler: nil)
                
                alert.addAction(ok)
                
                self.present(alert, animated:  true, completion: nil)
                return false
            }
        }
    }
    
    
   
    @IBAction func pressRegistrieren(_ sender: Any) {
        self.performSegue(withIdentifier: "toRegistrierenscreen", sender: nil)
    }
    
}
    

