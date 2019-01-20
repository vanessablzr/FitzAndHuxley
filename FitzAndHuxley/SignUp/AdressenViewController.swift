//
//  AdressenViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 27.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit

class AdressenViewController: UIViewController {
    
    
    @IBOutlet weak var lieferStrasseTextfield: UITextField!
    @IBOutlet weak var lieferNrTextfield: UITextField!
    @IBOutlet weak var lieferStadtTextfield: UITextField!
    @IBOutlet weak var lieferPlzTextfield: UITextField!
    
    @IBOutlet weak var switchUi: UISwitch!
    @IBOutlet weak var rechnungsView: UIView!
    
    @IBOutlet weak var rechnungStrasseTextfield: UITextField!
    @IBOutlet weak var rechnungNrTextfield: UITextField!
    @IBOutlet weak var rechnungStadtTextfield: UITextField!
    @IBOutlet weak var rechnungPlzTextfield: UITextField!
    
      let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
//        Stimmt Lieferadresse mit Rechnungsadresse überein, werden die Rechnungsdatenfelder nicht angezeigt
        rechnungsView.isHidden = true
    }
    
//    Erst durch ausfüllen der Felder wird der Benutzer auf den nächsten Screen geführt
//    Alle Daten zur Liefer bzw. Rechnungsadresse werden in den User Defaults gespeichert
    
    override func shouldPerformSegue(withIdentifier: String, sender: Any?) -> Bool {
        
        if (switchUi.isOn){
            
            if(lieferStrasseTextfield.text != "" && lieferNrTextfield.text != "" && lieferStadtTextfield.text != "" && lieferPlzTextfield.text != "" ){
            defaults.setValue(lieferStrasseTextfield.text, forKey: "lieferStrasse")
           
            defaults.setValue(lieferNrTextfield.text, forKey: "lieferNr")
            defaults.setValue(lieferStadtTextfield.text, forKey: "lieferStadt")
            defaults.setValue(lieferPlzTextfield.text, forKey: "lieferPlz")
                
                return true
            }
                
            else {
                let alertController = UIAlertController(title: "Fehler", message: "Ihre Eingabefehler sind leer", preferredStyle: .alert)
                
                let back = UIAlertAction(title: "Zurück", style: UIAlertAction.Style.cancel)
                
                alertController.addAction(back)
                
                self.present(alertController, animated: true, completion: nil)
                
                return false
            }
        }
        else {
            
            if(lieferStrasseTextfield.text != "" && lieferNrTextfield.text != "" && lieferStadtTextfield.text != "" && lieferPlzTextfield.text != "" && rechnungStrasseTextfield.text != "" && rechnungNrTextfield.text !=  "" && rechnungStadtTextfield.text != "" && rechnungPlzTextfield.text != ""){
                
                defaults.setValue(lieferStrasseTextfield.text, forKey: "lieferStrasse")
                defaults.setValue(lieferNrTextfield.text, forKey: "lieferNr")
                defaults.setValue(lieferStadtTextfield.text, forKey: "lieferStadt")
                defaults.setValue(lieferPlzTextfield.text, forKey: "lieferPlz")
                defaults.setValue(rechnungStrasseTextfield.text, forKey: "rechnungStrasse")
                defaults.setValue(rechnungNrTextfield.text, forKey: "rechnungNr")
                defaults.setValue(rechnungStadtTextfield.text, forKey: "rechnungStadt")
                defaults.setValue(rechnungPlzTextfield.text, forKey: "rechnungPlz")
                
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
    
//    Methode um die Rechnungsfelder anzuzeigen
    @IBAction func turnSwitch(_ sender: Any) {
        if (switchUi.isOn){
            rechnungsView.isHidden = true
        } else{
            rechnungsView.isHidden = false
        }
    }
    

}
