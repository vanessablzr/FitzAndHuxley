//
//  HomescreenViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 17.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class HomescreenViewController: UIViewController {

    @IBOutlet weak var backgroundPic: UIImageView!
    @IBOutlet weak var textView: UIView!
    
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.title = "Home"
        let firstStart : Bool? = UserDefaults.standard.object(forKey: "firstStart") as? Bool
        
        if firstStart == nil {
            self.createDemoData()
            UserDefaults.standard.set(false, forKey: "firstStart") 
        }
        
    }
    
//  Aufruf des Homescreens erstellt alle Artikel für die App
    
    func createDemoData() {
        let artikelEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "ArtikelEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        
        if artikelEntity != nil {
            let rucksack1: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            rucksack1.image = "1_EQUINOX"
            rucksack1.name = "EQUINOX"
            rucksack1.preis = 99.00
            rucksack1.farbe = "schwarz"
            rucksack1.groesse = "small"
            rucksack1.eigenschaften = "Unisex Mini-Rucksack (DinA4) in minimalistischem Design mit geräumiger Innentasche"
            rucksack1.material = "schwarzer, gewachster Canvas-Stoff (wasserabweisend, Lotuseffekt) - echtes, schwarz gefärbtes Glattleder"
            rucksack1.inWarenkorb = false
            rucksack1.id = "rucksack"
            
            let rucksack2: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            rucksack2.image = "1_SOLSTICE_berry"
            rucksack2.name = "SOLSTICE"
            rucksack2.preis = 99.00
            rucksack2.farbe = "berry"
            rucksack2.groesse = "small"
            rucksack2.eigenschaften = "Unisex Tages-Rucksack in minimalistischem Design mit Laptop-Fach und zwei geräumigen Taschen im Inneren"
            rucksack2.material = "gewachster Canvas-Stoff (wasserabweisend, Lotuseffekt) - echtes, leicht geöltes Rindsleder"
            rucksack2.inWarenkorb = false
            rucksack2.id = "rucksack"
            
            let weekender1: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            weekender1.image = "1_Humphrey"
            weekender1.name = "HUMPHREY"
            weekender1.preis = 189.00
            weekender1.farbe = "schwarz"
            weekender1.groesse = "small"
            weekender1.eigenschaften = "Weekender Bag in minimalistischem Design mit vier geräumigen Taschen im Inneren"
            weekender1.material = "Schwarzer, gewachster Canvas-Stoff (wasserabweisend, Lotuseffekt) - Applikationen aus echtem, schwarz gefärbtem Glattleder"
            weekender1.inWarenkorb = false
            weekender1.id = "weekender"
            
            let weekender2: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            weekender2.image = "1_PEARY"
            weekender2.name = "PEARY"
            weekender2.preis = 189.00
            weekender2.farbe = "braun"
            weekender2.groesse = "small"
            weekender2.eigenschaften = "Weekender Bag in minimalistischem Design mit vier geräumigen Taschen im Inneren"
            weekender2.material = "Schwarzer, gewachster Canvas-Stoff (wasserabweisend, Lotuseffekt) - Applikationen aus echtem, leicht geölten Glattleder"
            weekender2.inWarenkorb = false
            weekender2.id = "weekender"

            
            let armband1: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            armband1.image = "1_ALLY_dusk"
            armband1.name = "ALLY"
            armband1.preis = 19.00
            armband1.farbe = "braun"
            armband1.groesse = "small"
            armband1.eigenschaften = "Unisex Lederarmband längenverstellbar"
            armband1.material = "echtes, leicht geöltes Rindsleder"
            armband1.inWarenkorb = false
            armband1.id = "armband"
            
            let armband2: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            armband2.image = "1_ROTARY_dawn"
            armband2.name = "ROTARY"
            armband2.preis = 17.00
            armband2.farbe = "schwarz"
            armband2.groesse = "small"
            armband2.eigenschaften = "Unisex Lederarmband längenverstellbar"
            armband2.material = "echtes, schwarzes gefärbtes Glattleder"
            armband2.inWarenkorb = false
            armband2.id = "armband"
            
            let portemonnaie1: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            portemonnaie1.image = "1_MAGPIE_dawn"
            portemonnaie1.name = "MAGPIE"
            portemonnaie1.preis = 39.00
            portemonnaie1.farbe = "schwarz"
            portemonnaie1.groesse = "small"
            portemonnaie1.eigenschaften = "Unisex Geldbörse mit Geldklammer und Ultraflach, ohne Münzfach"
            portemonnaie1.material = "echtes, schwarzes gefärbtes Glattleder"
            portemonnaie1.inWarenkorb = false
            portemonnaie1.id = "portemonnaie"
            
            let portemonnaie2: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            portemonnaie2.image = "1_SORREL_dawn"
            portemonnaie2.name = "SORREL"
            portemonnaie2.preis = 39.00
            portemonnaie2.farbe = "schwarz"
            portemonnaie2.groesse = "small"
            portemonnaie2.eigenschaften = "Unisex Geldbörse mit Ultraflach, ohne Münzfach"
            portemonnaie2.material = "echtes, schwarzes gefärbtes Glattleder"
            portemonnaie2.inWarenkorb = false
             portemonnaie2.id = "portemonnaie"
            
            self.appDelegate.coreDataStack.saveContext()
        }
    }
    
//    Verknüpfung zu der Kategorie Rucksäcke durch Aktionsbildschirm
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CategoryDetailCollectionViewController {
            let subcategories = segue.destination as? CategoryDetailCollectionViewController
            subcategories?.subcategoryModifier = "rucksack"
        }
    }
    
}


