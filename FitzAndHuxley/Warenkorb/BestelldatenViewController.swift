//
//  BestelldatenViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 13.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class BestelldatenViewController: UIViewController {

    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var warenkorbArray : [WarenkorbEntity] = []
    
    
    @IBOutlet weak var preisGesamt: UILabel!
    
    @IBOutlet weak var userVorname: UILabel!
    @IBOutlet weak var userNachname: UILabel!
    @IBOutlet weak var userStrasse: UILabel!
    @IBOutlet weak var userStrassenNr: UILabel!
    @IBOutlet weak var userPlz: UILabel!
    @IBOutlet weak var userStadt: UILabel!
    
    @IBOutlet weak var userKarteninhaber: UILabel!
    @IBOutlet weak var userKartendatum: UILabel!
    @IBOutlet weak var userKartennummer: UILabel!
    
    var preis = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userVorname.text = UserDefaults.standard.string(forKey: "vorname")
        self.userNachname.text = UserDefaults.standard.string(forKey: "nachname")
        self.userStrasse.text = UserDefaults.standard.string(forKey: "lieferStrasse")
        self.userStrassenNr.text = UserDefaults.standard.string(forKey: "lieferNr")
        self.userPlz.text = UserDefaults.standard.string(forKey: "lieferPlz")
        self.userStadt.text = UserDefaults.standard.string(forKey: "lieferStadt")
        self.userKarteninhaber.text = UserDefaults.standard.string(forKey: "kartenInhaber")
        self.userKartennummer.text = UserDefaults.standard.string(forKey: "kartenNummer")
        self.userKartendatum.text = UserDefaults.standard.string(forKey: "kartenDatum")
        self.preisGesamt.text = preis
        
        fetchArtikel()
    }
    
    @IBAction func finishOrder(_ sender: Any) {
        deleteWarenkorbartikel()
    }
    
    @IBAction func dismissSegue(segue: UIStoryboardSegue){
        
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
    
    func deleteWarenkorbartikel() {
        for currentArtikel in warenkorbArray {
            self.appDelegate.coreDataStack.managedObjectContext.delete(currentArtikel)
        }
        self.appDelegate.coreDataStack.saveContext()
    }
}
