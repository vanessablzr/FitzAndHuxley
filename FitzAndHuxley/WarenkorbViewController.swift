//
//  WarenkorbViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 13.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit

class WarenkorbViewController: UIViewController {
    
    var warenkorbArray : [WarenkorbEntity] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gesamtSumme: UILabel!
    
    override func viewDidLoad() {
        
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
    
}

