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
        fetchArtikel(modifier: subcategoryModifier)
        title = setTitle(titleId: artikelArray[0].id)

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setTitle (titleId: String) -> String {
        switch titleId {
        case "rucksack":
            return "Rucksäcke"
        case "armband":
            return "Armbänder"
        case "portemonnaie":
            return "Portemonnaies"
        case "weekender":
            return "Weekender Bags"
        default:
            return "error"
        }
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
        cell.detailImage.image = UIImage(named: artikelArray[indexPath.row].image)
        cell.nameLabel.text = artikelArray[indexPath.row].name
        cell.priceLabel.text = preisLabel
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ArtikelDetailViewController{
            let detailVC = segue.destination as? ArtikelDetailViewController
            let index = collectionView.indexPathsForSelectedItems!.first!.row
            detailVC?.selectedArtikel = artikelArray[index]
        }
    }
    
} 




 

