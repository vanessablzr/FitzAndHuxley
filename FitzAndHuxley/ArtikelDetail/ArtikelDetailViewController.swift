//
//  ArtikelDetailViewController.swift
//  FitzAndHuxley
//
//  Created by Philipp on 08.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class ArtikelDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var warenkorbIcon: UIBarButtonItem!
    
    @IBOutlet weak var btnGroesse: UIButton!
    @IBOutlet weak var tblvGroesse: UITableView!
    
    @IBOutlet weak var btnFarbe: UIButton!
    @IBOutlet weak var tblvFarbe: UITableView!
    
    @IBOutlet weak var txtfldAnzahl: UITextField!
    
    var groesseArray = ["S", "M", "L"]
    var farbeArray = ["Rot", "Schwarz", "Blau", "Grau"]
    
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var selectedArtikel: ArtikelEntity!
    
    var selectedGroesse = "S"
    var selectedFarbe = "Rot"
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
        tblvGroesse.isHidden = true
        tblvFarbe.isHidden = true
        self.txtfldAnzahl.delegate = self
        
        
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
    
    
// beim Klick auf den Button wird ein neuer Warenkorbartikel erstellt mit der angegebenen Anzahl
    @IBAction func btnInWarenkorb(_ sender: Any) {
        if (txtfldAnzahl.text?.isEmpty)! {
            selectedAnzahl = "1"
        } else {
            selectedAnzahl = txtfldAnzahl.text!
        }
        createNewWarenkorbEntity()
    }
    
    @IBAction func btnGroesseAction(_ sender: Any) {
        if tblvGroesse.isHidden {
            animateBtnGroesse(toggle: true)
        } else {
            animateBtnGroesse(toggle: false)
        }
    }
    
    @IBAction func btnFarbeAction(_ sender: Any) {
        if tblvFarbe.isHidden {
            animateBtnFarbe(toggle: true)
        } else {
            animateBtnFarbe(toggle: false)
        }
    }
//Toggled die Dropdownmenüs
    func animateBtnGroesse(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.0){
                self.tblvGroesse.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.0){
                self.tblvGroesse.isHidden = true
            }
        }
    }
    func animateBtnFarbe(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.0){
                self.tblvFarbe.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.0){
                self.tblvFarbe.isHidden = true
            }
        }
    }
    
//    Animation des Warenkorb Icon beim Einfügen
    @IBAction func pressInWarenkorb(_ sender: Any) {
        
    }
}



extension ArtikelDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
        case tblvGroesse:
            numberOfRow = groesseArray.count
        case tblvFarbe:
            numberOfRow = farbeArray.count
        default:
            print("Fehler in numbersOfRowInSection switch")
        }
        
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView {
        case tblvGroesse:
            cell = tableView.dequeueReusableCell(withIdentifier: "groesseCell", for: indexPath)
            cell.textLabel?.text = groesseArray[indexPath.row]
        case tblvFarbe:
            cell = tableView.dequeueReusableCell(withIdentifier: "farbeCell", for: indexPath)
            cell.textLabel?.text = farbeArray[indexPath.row]
        default:
            print("Fehler in cellForRowAt switch")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case tblvGroesse:
            btnGroesse.setTitle("\(groesseArray[indexPath.row])", for: .normal)
            animateBtnGroesse(toggle: false)
            selectedGroesse = groesseArray[indexPath.row]
        case tblvFarbe:
            btnFarbe.setTitle("\(farbeArray[indexPath.row])", for: .normal)
            animateBtnFarbe(toggle: false)
            selectedFarbe = farbeArray[indexPath.row]
        default:
            print("Fehler in didSelectRowAt switch")
        }
        
        
    }
    
    
    
}
