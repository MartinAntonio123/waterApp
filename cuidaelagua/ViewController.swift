//
//  ViewController.swift
//  cuidaelagua
//
//  Created by Martin Vivanco on 10/2/19.
//  Copyright © 2019 Martin Vivanco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var user = UserDefaults.standard.string(forKey: "user")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user == nil{
            UserDefaults.standard.set("name", forKey: "user")
            UserDefaults.standard.set(0, forKey: "regadera")
            UserDefaults.standard.set(0, forKey: "lavabo")
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "mainToRegister", sender: self)
    }
    @IBAction func estadisticsButton(_ sender: Any) {
        performSegue(withIdentifier: "mainToEstadisticas", sender: self)
    }
    @IBAction func compartirButton(_ sender: Any) {
        performSegue(withIdentifier: "mainToShare", sender: self)
    }
}

