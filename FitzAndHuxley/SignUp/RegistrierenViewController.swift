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
    @IBOutlet weak var passwortTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressWeiter(_ sender: Any) {
        
        if (vornameTextfield.text == "" || nachnameTextfield.text ==  "" ||
            emailTextfield.text ==  "" || passwortTextfield.text == "") {
            
            let alert = UIAlertController(title: "Fehler", message: "Bitte füllen Sie die vorgegebenen Felder aus", preferredStyle: .alert)
            
            let back = UIAlertAction(title: "Zurück", style: .default, handler: nil)
            
            alert.addAction(back)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
             let app = UIApplication.shared.delegate as! AppDelegate
            
            let context = app.persistentContainer.viewContext
            
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "EntityKonto", into: context)
            
            newUser.setValue(vornameTextfield.text, forKey: "vorname")
        newUser.setValue(nachnameTextfield.text, forKey: "nachname")
            newUser.setValue(emailTextfield.text, forKey: "email")
        newUser.setValue(passwortTextfield.text, forKey: "passwort")
           
            do {
                try context.save()
                print("erfolgreich")
            }
            catch {
                let Fetcherror = error as NSError
                 print("error", Fetcherror.localizedDescription)
            }
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    


}
