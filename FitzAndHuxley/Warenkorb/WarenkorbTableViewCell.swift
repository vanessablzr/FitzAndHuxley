//
//  WarenkorbTableViewCell.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 13.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit

class WarenkorbTableViewCell: UITableViewCell {
    
//    Outlets
    @IBOutlet weak var imageArtikel: UIImageView!
    @IBOutlet weak var nameArtikel: UILabel!
    @IBOutlet weak var loeschenButton: UIButton!
    @IBOutlet weak var preisArtikel: UILabel!
    @IBOutlet weak var artikelFarbe: UILabel!
    @IBOutlet weak var artikelGroesse: UILabel!
    @IBOutlet weak var artikelAnzahl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
