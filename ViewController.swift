//
//  ViewController.swift
//  Memory
//
//  Created by Ivana Fidanovska on 9/24/20.
//  Copyright © 2020 Fidanovska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var letsPartyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpButton()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func letsBooActionButton(_ sender: Any) {
        performSegue(withIdentifier: "homeToLevelsSegue", sender: nil)
    }
    
    func setUpButton(){
        letsPartyButton.layer.shadowColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 0.76).cgColor
        letsPartyButton.layer.shadowOffset = CGSize(width: 8, height: 11)
        letsPartyButton.layer.shadowOpacity = 1
        letsPartyButton.layer.shadowRadius = 15
    }
    
}

