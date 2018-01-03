//
//  ViewController.swift
//  ViewPresentation
//
//  Created by Kawnayeen on 1/3/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func openCameraRoll(_ sender: Any) {
        showCameraRoll()
    }
    
    func showCameraRoll () {
        let cameraRoll = UIImagePickerController()
        self.present(cameraRoll, animated: true, completion: nil)
    }
}

