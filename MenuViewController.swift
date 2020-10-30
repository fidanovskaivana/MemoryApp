//
//  MenuViewController.swift
//  Memory
//
//  Created by Ivana Fidanovska on 9/24/20.
//  Copyright © 2020 Fidanovska. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var easyButton: UIButton!
    @IBOutlet var mediumButton: UIButton!
    @IBOutlet var hardButton: UIButton!
    
    
    var setGame = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
    //-MARK: Actions

    @IBAction func easyButtonAction(_ sender: Any) {
        
        setGame = 1
    }
    
    
    @IBAction func mediumButtonAction(_ sender: Any) {
        
        setGame = 2
    }
    
    
    @IBAction func hardButtonAction(_ sender: Any) {
        
        setGame = 3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GameViewController {
            controller.setGame = self.setGame
        }
    }
    
    func setUpButtons(){
        
        easyButton.layer.borderWidth = 10
        easyButton.layer.borderColor = UIColor(red: 0.942, green: 0.226, blue: 0, alpha: 1).cgColor
        easyButton.layer.shadowColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 0.65).cgColor
        easyButton.layer.shadowOpacity = 1
        easyButton.layer.shadowRadius = 15
        easyButton.layer.shadowOffset = CGSize(width: 16, height: 17)
        mediumButton.layer.borderWidth = 10
        mediumButton.layer.borderColor = UIColor(red: 0.942, green: 0.226, blue: 0, alpha: 1).cgColor
        mediumButton.layer.shadowColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 0.65).cgColor
        mediumButton.layer.shadowOpacity = 1
        mediumButton.layer.shadowRadius = 15
        mediumButton.layer.shadowOffset = CGSize(width: 16, height: 17)
        hardButton.layer.borderWidth = 10
        hardButton.layer.borderColor = UIColor(red: 0.942, green: 0.226, blue: 0, alpha: 1).cgColor
        hardButton.layer.shadowColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 0.65).cgColor
        hardButton.layer.shadowOpacity = 1
        hardButton.layer.shadowRadius = 15
        hardButton.layer.shadowOffset = CGSize(width: 16, height: 17)
        
    }
    
    
}
