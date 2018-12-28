//
//  ArikelansichtViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 28.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit

class ArikelansichtViewController: UIViewController {

    @IBOutlet var groesseButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pressGroesse(_ sender: Any) {
        groesseButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                 button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
            }
        }
    }

enum Groessen : String{
case gross = "groß"
case mittel = "mittel"
case klein = "klein"
}
func groesseGewaehlt(_ sender: UIButton) {
        guard let title = sender.currentTitle, let groesse = Groessen(rawValue: title) else {
            return
    }
    
    switch groesse {
    case .gross:
        print("groß")
    case .mittel:
        print("mittel")
    case.klein:
        print("klein")
    default:
        print("default")
    }
}
