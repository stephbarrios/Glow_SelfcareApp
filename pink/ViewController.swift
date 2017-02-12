//
//  ViewController.swift
//  pink
//
//  Created by Gianne Flores on 2/11/17.
//  Copyright © 2017 Gianne Flores. All rights reserved.
//

import UIKit

var username = "Pearl"

class ViewController: UIViewController {
 
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var background: UIImageView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.resignFirstResponder()
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    @IBAction func pressContinue(_ sender: Any) {
        let newUsername = usernameTextField.text!
        if (newUsername == "Pearl"){
            performSegue(withIdentifier: "loginToWelcome", sender: self)
            
        }
        else{

            performSegue(withIdentifier: "loginToQuote", sender: self)
    }
    
    
    }
    
    
    
    
    
}

