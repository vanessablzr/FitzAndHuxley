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


    
    

    
    

    

