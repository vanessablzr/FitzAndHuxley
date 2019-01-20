//
//  WarenkorbTableViewCell.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 13.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData
import NotificationCenter

protocol refreshTotal {
    func calculateTotal()
}

class WarenkorbTableViewCell: UITableViewCell {
    
//    Outlets
    @IBOutlet weak var imageArtikel: UIImageView!
    @IBOutlet weak var nameArtikel: UILabel!
    @IBOutlet weak var artikelFarbe: UILabel!
    @IBOutlet weak var artikelGroesse: UILabel!
    @IBOutlet weak var artikelAnzahl: UILabel!
    @IBOutlet weak var preisArtikel: UILabel!
    

    
    var artikel: WarenkorbEntity!
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
//    var delegate: updateTotal?
    var delegate: refreshTotal!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

    @IBAction func didIncreaseCount(_ sender: Any) {
        var anzahl = 0
        anzahl = Int(artikel.anzahl!)!
        anzahl += 1
        let erg = "\(anzahl)"
        artikel.anzahl = erg
        artikelAnzahl.text = erg
        self.appDelegate.coreDataStack.saveContext()
        delegate.calculateTotal()

    }
    @IBAction func didDecreaseCount(_ sender: Any) {
        var anzahl = 0
        anzahl = Int(artikel.anzahl!)!
        if anzahl >= 1 {
            anzahl -= 1
        }
        let erg = "\(anzahl)"
        artikel.anzahl = erg
        artikelAnzahl.text = erg
        self.appDelegate.coreDataStack.saveContext()
        delegate.calculateTotal()

    }
}
