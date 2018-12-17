//
//  LogInViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 14.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwortTextfield: UITextField!
    
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    Antwort der kreierten Ressourcen
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchObject () {
        
    
    }
    
    
    @IBAction func pressAnmelden(_ sender: Any) {
        if (emailTextfield.text == "" && passwortTextfield.text == "") {
            
            let alert = UIAlertController(title: "Fehler", message: "Bitte geben Sie die vorangegebenen Felder ein", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Zurück", style: .default, handler: nil)
            
            alert.addAction(ok)
            
            self.present(alert, animated:  true, completion: nil)
            }
            
        else {

        }
        
//        VERHINDERN WEITERLEITUNG VIEWCONTROLLER
        
        
    }
    
   
    }
    
    

