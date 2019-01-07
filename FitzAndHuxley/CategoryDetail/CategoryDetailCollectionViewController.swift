//
//  CategoryDetailCollectionViewController.swift
//  FitzAndHuxley
//
//  Created by Philipp on 06.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData


class CategoryDetailCollectionViewController: UICollectionViewController {
    
    var artikelArray: [ArtikelEntity] = []
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var subcategoryModifier = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func fetchArtikel(modifier: String){
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArtikelEntity")
        fetchRequest.predicate = NSPredicate(format: "id == %@", modifier)
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                let fetchedArtikel: [ArtikelEntity]? = results as? [ArtikelEntity]
                if fetchedArtikel != nil {
                    artikelArray = fetchedArtikel!
                }
            }
        }
        catch {
            fatalError("There was an error fetching the items")
        } 
        
        
        
    }

   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return artikelArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDetailCell", for: indexPath) as! CategoryDetailCollectionViewCell
        let preis = artikelArray[indexPath.row].preis
        let preisLabel = "\(preis)" + "€"
        cell.CategoryDetailCellImage.image = UIImage(named: artikelArray[indexPath.row].image)
        cell.CategoryDetailCellName.text = artikelArray[indexPath.row].name
        cell.CategoryDetailCellPrice.text = preisLabel
    
        return cell
    }
    
}


