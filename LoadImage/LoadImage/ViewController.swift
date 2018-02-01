//
//  ViewController.swift
//  LoadImage
//
//  Created by Kawnayeen on 1/31/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")
        let task = URLSession.shared.dataTask(with: imageURL!){
            (data, response, error) in
            if error == nil {
                let downloadedImage = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }
            }
        }
        task.resume()
    }
}

