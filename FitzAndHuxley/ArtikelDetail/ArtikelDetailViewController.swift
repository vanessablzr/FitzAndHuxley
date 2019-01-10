//
//  ArtikelDetailViewController.swift
//  FitzAndHuxley
//
//  Created by Philipp on 08.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import UIKit
import CoreData

class ArtikelDetailViewController: UIViewController {

    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var selectedArtikel: ArtikelEntity!
    
    @IBOutlet weak var ArtikelDetailImage: UIImageView!
    @IBOutlet weak var ArtikelDetailName: UILabel!
    @IBOutlet weak var ArtikelDetailPreis: UILabel!
    @IBOutlet weak var ArtikelDetailEigenschaft: UILabel!
    @IBOutlet weak var ArtikelDetailMaterial: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtikel.name
        setArtikelData()
        
        // Do any additional setup after loading the view.
    }
    
    func setArtikelData(){
        let preis = selectedArtikel.preis
        let preisLabel = "\(preis)" + "€"

        ArtikelDetailImage.image = UIImage(named: selectedArtikel.image)
        ArtikelDetailName.text = selectedArtikel.name
        ArtikelDetailPreis.text = preisLabel
        ArtikelDetailEigenschaft.text = selectedArtikel.eigenschaften
        ArtikelDetailMaterial.text = selectedArtikel.material
    }

}
