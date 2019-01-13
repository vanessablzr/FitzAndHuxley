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
        warenkorbArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
