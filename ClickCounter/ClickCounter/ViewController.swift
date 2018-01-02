//
//  ViewController.swift
//  ClickCounter
//
//  Created by Kawnayeen on 1/2/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    @IBOutlet var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addUIElementProgramatically()
    }
    
    func addUIElementProgramatically() {
        showLabel()
        showButton()
    }
    
    func showLabel() {
        let label = UILabel()
        label.frame = CGRect(origin: CGPoint(x:175,y:150), size: CGSize(width: 100, height: 30))
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
    }
    
    func showButton() {
        let button = UIButton()
        button.frame = CGRect(origin: CGPoint(x:135, y:200), size: CGSize(width: 100, height: 45))
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        // Add button event
        button.addTarget(self, action: #selector(incrementCount), for: UIControlEvents.touchUpInside)
    }
    
    @IBAction func clicked(_ sender: Any) {
        incrementCount()
    }
    
    func incrementCount() {
        self.count += 1;
        self.label.text = "\(self.count)"
    }
}

