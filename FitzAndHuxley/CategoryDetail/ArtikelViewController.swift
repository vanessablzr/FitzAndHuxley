//
//  ArtikelViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 04.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class ArtikelViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var artikel : [ArtikelEntity] = []
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstStart : Bool? = UserDefaults.standard.object(forKey: "firstStart") as? Bool
        
        if firstStart == nil {
            self.createDemoData()
            UserDefaults.standard.set (false, forKey: "firstStart" )
        
        }
        
        self.fetchDemoData()
//        self.collectionView.dataSource = self
        self.collectionView.delegate = (self as! UICollectionViewDelegate)

    }
    
    func createDemoData() {
        let artikelEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "ArtikelEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        
        if artikelEntity != nil {
            let artikel1: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            artikel1.image = "1_EQUINOX"
            artikel1.name = "EQUINOX"
            artikel1.preis = "99.00"
            
            let artikel2: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            artikel2.image = "1_CONVEYOR_grey-ve"
            artikel2.name = "CONVEYOR"
            artikel2.preis = "79.00"
            
            let artikel3: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            artikel3.image = "1_SOLSTICE_berry"
            artikel3.name = "SOLSTICE"
            artikel3.preis = "99.00"
            
            let artikel4: ArtikelEntity = ArtikelEntity(entity: artikelEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            artikel4.image = "1_CURATOR"
            artikel4.name = "CURATOR"
            artikel4.preis = "89.00"
  
            self.appDelegate.coreDataStack.saveContext()
        }
    }
    
    func fetchDemoData() {
        let fetchRequest : NSFetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "ArtikelEntity")
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                let fetchedArtikel: [ArtikelEntity]? = results as? [ArtikelEntity]
                if fetchedArtikel != nil {
                    self.artikel = fetchedArtikel!
                }
            }
        }
        catch {
           fatalError("fetch error")
        }
    }

}

//extension ArtikelViewController : UICollectionViewDataSource
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return artikel.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var cell : CollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "artikelCell", for: indexPath) as? CollectionViewCell
//
//        cell.artikelBild.image = UIImage(named: )
//
//        return cell
//    }


    
    

    
    

    

