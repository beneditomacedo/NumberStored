//
//  ViewController.swift
//  NumberStored
//
//  Created by Benedito Macedo on 25/05/19.
//  Copyright © 2019 bamacedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var status: UILabel!
    @IBAction func store(_ sender: Any) {
        
        if let n = number.text {
            UserDefaults.standard.set(n, forKey: "number")
        }
        
        checkStored()
        number.text = ""
    }

    @IBAction func remove(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "number")
        
        checkStored()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkStored()
    }
    
    func checkStored() {
        
        let nStoredObject = UserDefaults.standard.object(forKey: "number")
        
        if let nStored = nStoredObject as? String {
            status.text = "The value stored is \(nStored)"
        } else {
            status.text = "No value stored"
        }
    }
}

