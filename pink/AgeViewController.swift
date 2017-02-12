//
//  AgeViewController.swift
//  pink
//
//  Created by Gianne Flores on 2/11/17.
//  Copyright © 2017 Gianne Flores. All rights reserved.
//

import UIKit
var age = ""
class AgeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   
    @IBOutlet weak var preteen: UIButton!
    
    @IBOutlet weak var teen: UIButton!
    
    @IBOutlet weak var youngAdult: UIButton!
    
    @IBOutlet weak var adult: UIButton!
    
    @IBOutlet weak var agePicker: UIPickerView!
  
    
     var pickerData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.delegate=self
        self.agePicker.delegate = self
         pickerData = ["Adolescent (10-17)","Young Adult (18-25)", "Adult (26-50)", "Older (51+)"]

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func choosePreteen(_ sender: Any) {
        age = "Adolescent"
    }
    
    @IBAction func chooseTeen(_ sender: Any) {
        age = "Young Adult"
    }
    
    @IBAction func chooseYoungAdult(_ sender: Any) {
        age = "Adult"
    }
    
    @IBAction func chooseAdult(_ sender: Any) {
        age = "Olde"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    
    //MARK: Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    
    
    

    }
