//
//  BothUsersViewController.swift
//  pink
//
//  Created by Gianne Flores on 2/12/17.
//  Copyright © 2017 Gianne Flores. All rights reserved.
//

import UIKit
import QuotzzyKit

class BothUsersViewController: UIViewController {
    
    @IBOutlet weak var quoteTextView: UITextView!
    //var quote:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
            }
    override func viewDidAppear(_ animated: Bool) {
        Quotzzy.sharedClient().getQuote(lang: .English, key: nil, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
            if error == nil {
                print("\((quote?.text)! as String) - \((quote?.author?.name)! as String)(\((quote?.author?.wiki)! as String))")
                self.changeQuote(newQuote: (quote?.text)! as String)
            }
            // self.quote = (quote?.text)! as String
            
        })
    }
    
    func changeQuote(newQuote:String){
        DispatchQueue.main.sync {
            self.quoteTextView.text = newQuote
        }
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
