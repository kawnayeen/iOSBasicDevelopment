//
//  ViewController.swift
//  LoadImage
//
//  Created by Kawnayeen on 1/31/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = URL(string: "https://en.wikipedia.org/wiki/Cat#/media/File:Feral_cat_Virginia_crop.jpg")
        let task = URLSession.shared.dataTask(with: imageURL!){
            (data, response, error) in
            print("Task Finish")
        }
        task.resume()
    }
}

