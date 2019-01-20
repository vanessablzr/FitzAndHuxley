//
//  ZahlungsViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 20.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class ZahlungsViewController: UIViewController {

    @IBOutlet weak var karteninhaberTextfield: UITextField!
    @IBOutlet weak var kartennummerTextfield: UITextField!
    @IBOutlet weak var kartenDatumTextfield: UITextField!
    @IBOutlet weak var CvvTextfield: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var eingabeFelderView: UIView!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eingabeFelderView.isHidden = false
    }
    
//    Daten zur Bezahlung werden in UserDefaults gespeichert
//    Erst nach Ausfüllung der Felder wird der benutzer weitergeleitet
    
    override func shouldPerformSegue(withIdentifier: String, sender: Any?) -> Bool {
            
            if (karteninhaberTextfield.text != "" && kartennummerTextfield.text != "" && kartenDatumTextfield.text != "" && CvvTextfield.text != "") {
                
            defaults.setValue(karteninhaberTextfield.text, forKey: "kartenInhaber")
            defaults.setValue(kartennummerTextfield.text, forKey: "kartenNr")
            defaults.setValue(kartenDatumTextfield.text, forKey: "kartenDatum")
            defaults.setValue(CvvTextfield.text, forKey: "kartenCvv")
                
                return true
                
            } else {
                
                let alert = UIAlertController(title: "Fehler", message: "Bitte geben Sie die vorangegebenen Felder ein", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "Zurück", style: .default, handler: nil)
                
                alert.addAction(ok)
                
                self.present(alert, animated:  true, completion: nil)
                
                return false
            }
    }

    }
    

    

