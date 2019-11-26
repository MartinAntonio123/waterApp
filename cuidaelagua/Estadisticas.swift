//
//  Estadisticas.swift
//  cuidaelagua
//
//  Created by Martin Vivanco on 11/6/19.
//  Copyright © 2019 Martin Vivanco. All rights reserved.
//

import UIKit

class Estadisticas: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var lavaboLabel: UILabel!
    @IBOutlet weak var regaderaLabel: UILabel!
    var regadera = UserDefaults.standard.integer(forKey: "regadera")
    var lavabo = UserDefaults.standard.integer(forKey: "lavabo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regaderaLabel.text = "Regadera: \(regadera)L"
        lavaboLabel.text = "Lavabo: \(lavabo)L"
        totalLabel.text = "Total: \(regadera+lavabo)L"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
