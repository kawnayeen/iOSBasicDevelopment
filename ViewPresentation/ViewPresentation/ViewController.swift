//
//  ViewController.swift
//  ViewPresentation
//
//  Created by Kawnayeen on 1/3/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dismissAlert : ((_ action : UIAlertAction) -> Void)? = nil
    
    @IBAction func openCameraRoll(_ sender: Any) {
        let cameraRoll = UIImagePickerController()
        self.present(cameraRoll, animated: true, completion: nil)
    }
    
    @IBAction func openActivityView(_ sender: Any) {
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func showAlertDialog(_ sender: Any) {
        let alertController = UIAlertController()
        alertController.title = "Hello iOS"
        alertController.message = "Showing an alert message is so easy :)"
        self.dismissAlert = { action in self.dismiss(animated: true, completion: nil) }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: self.dismissAlert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func goToDiceView(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DiceView") as! DiceViewController
        self.present(controller, animated: true, completion: nil)
    }
}

