//
//  Registrar.swift
//  cuidaelagua
//
//  Created by Martin Vivanco on 11/6/19.
//  Copyright © 2019 Martin Vivanco. All rights reserved.
//

import UIKit

class Registrar: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerData[row] == "Regadera"
        {
            print("regadera")
            selected = "regadera"
            waterpers = 20/60
        }
        if pickerData[row] == "Lavabo"
        {
            print("Lavabo")
            selected = "lavabo"
            waterpers = 18/90
        }
    }
    
    @IBOutlet weak var pickerWater: UIPickerView!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var regadera = UserDefaults.standard.integer(forKey: "regadera")
    var lavabo = UserDefaults.standard.integer(forKey: "lavabo")
    var timer = Timer()
    var time:Int = 0
    var totalWater:Int = 0
    var waterpers:Float = 0.333
    var pickerData: [String] = [String]()
    var selected = "regadera"
    
    @objc func update()
    {
        time = time + 1
        totalWater = Int(Float(time) * waterpers)
        timeLabel.text = "Tiempo: \(time) s"
        waterLabel.text = "Agua usada: \(Float(time) * waterpers) L"
    }
    func runTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(update)), userInfo: nil, repeats: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerWater.delegate = self
        self.pickerWater.dataSource = self
        pickerData = ["Regadera", "Lavabo"]
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func startButton(_ sender: Any) {
        runTimer()
    }
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func registerButton(_ sender: Any) {
        if selected == "regadera"
        {
            UserDefaults.standard.set(regadera+totalWater, forKey: "regadera")
        }
        if selected == "lavabo"
        {
            UserDefaults.standard.set(lavabo+totalWater, forKey: "lavabo")
        }
    }
}

