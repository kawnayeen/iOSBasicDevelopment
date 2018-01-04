//
//  DiceViewController.swift
//  ViewPresentation
//
//  Created by Kawnayeen on 1/3/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    var firstValue: Int?
    var secondValue: Int?
    
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        if let firstValue = self.firstValue {
            self.firstDice.image = UIImage(imageLiteralResourceName: "d\(firstValue)")
        }
        
        if let secondValue = self.secondValue {
            self.secondDice.image = UIImage(imageLiteralResourceName: "d\(secondValue)")
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
