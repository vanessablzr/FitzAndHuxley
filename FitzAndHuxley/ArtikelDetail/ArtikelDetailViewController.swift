//
//  ArtikelDetailViewController.swift
//  FitzAndHuxley
//
//  Created by Philipp on 08.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class ArtikelDetailViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData : [[String]] = [[String]]()
    
    @IBOutlet weak var txtfldAnzahl: UITextField!
    @IBOutlet weak var warenkorbIcon: UIBarButtonItem!
    
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var selectedArtikel: ArtikelEntity!
    
    var selectedGroesse = "S"
    var selectedFarbe = "Schwarz"
    var selectedAnzahl = "1"
    
    @IBOutlet weak var ArtikelDetailImage: UIImageView!
    @IBOutlet weak var ArtikelDetailName: UILabel!
    @IBOutlet weak var ArtikelDetailPreis: UILabel!
    @IBOutlet weak var ArtikelDetailEigenschaft: UILabel!
    @IBOutlet weak var ArtikelDetailMaterial: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtikel.name
        setArtikelData()
        self.picker.delegate = self
        self.picker.dataSource = self
        self.txtfldAnzahl.delegate = self
        
        pickerData = [["S", "M", "L"], ["Schwarz","Rot","Grau"]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Erstellen der Komponenten für Picker
    func numberOfComponents(in pickerView: UIPickerView) ->Int {
    return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedFarbe = pickerData[0][row]
        }
        if component == 1 {
            selectedGroesse = pickerData[1][row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
// erstellt Artikel für Warenkorb
    func createNewWarenkorbEntity() {
        let warenkorbEntity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "WarenkorbEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        
        if warenkorbEntity != nil {
           let currentArtikel = WarenkorbEntity(entity: warenkorbEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            currentArtikel.farbe = selectedFarbe
            currentArtikel.groesse = selectedGroesse
            currentArtikel.anzahl = selectedAnzahl
            
            currentArtikel.image = selectedArtikel.image
            currentArtikel.name = selectedArtikel.name
            currentArtikel.preis = selectedArtikel.preis
        }
        
        self.appDelegate.coreDataStack.saveContext()
    }
//    setzt die Daten des Artikels
    func setArtikelData(){
        let preis = selectedArtikel.preis
        let preisLabel = "\(preis)" + "€"

        ArtikelDetailImage.image = UIImage(named: selectedArtikel.image)
        ArtikelDetailName.text = selectedArtikel.name
        ArtikelDetailPreis.text = preisLabel
        ArtikelDetailEigenschaft.text = selectedArtikel.eigenschaften
        ArtikelDetailMaterial.text = selectedArtikel.material
    }
//    nur Zahlen erlaubt
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet (charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
// beim Klick auf den Button wird ein neuer Warenkorbartikel mit der angegebenen Anzahl erstellt
    @IBAction func btnInWarenkorb(_ sender: UIButton) {
        if (txtfldAnzahl.text?.isEmpty)! {
            selectedAnzahl = "1"
        } else {
            selectedAnzahl = txtfldAnzahl.text!
        }
        createNewWarenkorbEntity()
    }
    
//    Funktion umer WarenkorbIcon zu animieren
    func animateWarenkorbIcon (_ warenkornIcon : UIBarButtonItem){
        
    }
   
}
