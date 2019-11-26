//
//  Profile.swift
//  cuidaelagua
//
//  Created by Martin Vivanco on 11/6/19.
//  Copyright © 2019 Martin Vivanco. All rights reserved.
//

import UIKit
import Firebase

class Profile: UIViewController {
    
    @IBOutlet weak var sexValue: UISegmentedControl!
    @IBOutlet weak var mySteper: UIStepper!
    @IBOutlet weak var ageVal: UITextField!
    var regadera = UserDefaults.standard.integer(forKey: "regadera")
    var lavabo = UserDefaults.standard.integer(forKey: "lavabo")
    var ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func shareButton(_ sender: Any) {
        var sex = "n"
        if sexValue.selectedSegmentIndex == 0
        {
            sex = "m"
        }
        else
        {
            sex = "f"
        }
        ref.childByAutoId().setValue([
            "edad" : Float(ageVal.text!)!,
            "sexo" : sex,
            "regadera" : regadera,
            "lavabo" : lavabo
            ]);
    }
    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func stepAction(_ sender: Any) {
        ageVal.text = String(mySteper.value)
    }
    @IBAction func sexSelect(_ sender: Any) {
        print(sexValue.selectedSegmentIndex)
    }
    
}
