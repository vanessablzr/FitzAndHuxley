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

    @IBOutlet weak var userVorname: UILabel!
    @IBOutlet weak var userNachname: UILabel!
    @IBOutlet weak var userStrasse: UILabel!
    @IBOutlet weak var userStrassenNr: UILabel!
    @IBOutlet weak var userPlz: UILabel!
    @IBOutlet weak var userStadt: UILabel!
    
    @IBOutlet weak var userKarteninhaber: UILabel!
    @IBOutlet weak var userKartendatum: UILabel!
    @IBOutlet weak var userKartennummer: UILabel!
    
    
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
    }
}
