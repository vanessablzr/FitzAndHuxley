//
//  WarenkorbViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 13.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class WarenkorbViewController: UIViewController {
    
    var warenkorbArray : [WarenkorbEntity] = []
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var preisGesamt = ""

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gesamtSumme: UILabel!
    
    override func viewDidLoad() {
        fetchArtikel()
        calculateTotal()
        gesamtSumme.text = preisGesamt
    }
    
    func fetchArtikel(){
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WarenkorbEntity")
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                let fetchedArtikel: [WarenkorbEntity]? = results as? [WarenkorbEntity]
                if fetchedArtikel != nil {
                    warenkorbArray = fetchedArtikel!
                }
            }
        }
        catch {
            fatalError("There was an error fetching the items")
        }
    }
    
    func calculateTotal(){
        var total = 0.0
        for currentArtikel in warenkorbArray {
            total += currentArtikel.preis
        }
        let erg = "\(total)€"
        preisGesamt = erg
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is BestelldatenViewController {
            let bestelldaten = segue.destination as? BestelldatenViewController
            bestelldaten?.preis = preisGesamt
        }
    }
    
}
extension WarenkorbViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return warenkorbArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "warenkorbCell", for: indexPath) as! WarenkorbTableViewCell
        
        let currentArtikel = warenkorbArray[indexPath.row]
        let preis = currentArtikel.preis
        let preisLabel = "\(preis)" + "€"
        
        cell.artikelAnzahl.text = currentArtikel.anzahl
        cell.artikelFarbe.text = currentArtikel.farbe
        cell.artikelGroesse.text = currentArtikel.groesse
        cell.nameArtikel.text = currentArtikel.name
        cell.preisArtikel.text = preisLabel
        cell.imageArtikel.image = UIImage(named: currentArtikel.image!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let deleteWarenkorbartikel : WarenkorbEntity = warenkorbArray[indexPath.row]
            warenkorbArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            calculateTotal()
            gesamtSumme.text = preisGesamt
            self.appDelegate.coreDataStack.managedObjectContext.delete(deleteWarenkorbartikel)
            self.appDelegate.coreDataStack.saveContext()
        }
        
    }
    
}

