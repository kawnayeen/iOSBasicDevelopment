//
//  ViewController.swift
//  SleepingInTheLibrary
//
//  Created by Kawnayeen on 2/7/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var grabImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func grabNewImage(_ sender: UIButton) {
        setUI(enabled: false)
        getImageFromFlickr()
    }
    
    private func setUI(enabled isEnabled: Bool){
        photoTitleLabel.isEnabled = isEnabled
        grabImageButton.isEnabled = isEnabled
        
        if isEnabled {
            grabImageButton.alpha = 1.0
        } else {
            grabImageButton.alpha = 0.5
        }
    }
    
    private func getImageFromFlickr() {
        let methodParameters = [
            Constants.FlickrParameterKeys.METHOD: Constants.FlickrParameterValues.GalleryPhotoMethod,
            Constants.FlickrParameterKeys.API_KEY: Constants.FlickrParameterValues.API_KEY,
            Constants.FlickrParameterKeys.GALLERY_ID: Constants.FlickrParameterValues.GalleryId,
            Constants.FlickrParameterKeys.EXTRAS: Constants.FlickrParameterValues.MediumURL,
            Constants.FlickrParameterKeys.FORMAT: Constants.FlickrParameterValues.ResponseFormat,
            Constants.FlickrParameterKeys.NO_JSON_CALLBACK: Constants.FlickrParameterValues.DisableJSONCallback
        ]
        let urlString = Constants.Flickr.BASE_URL + escapedParameters(methodParameters)
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let data = data {
                    let parsedResult: [String:AnyObject]!
                    do {
                        parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
                    } catch {
                        //displayError("Could not parese the data as JSON: '\(data)'")
                        return
                    }
                    //print(parsedResult)
                    if let photosDictionary = parsedResult[Constants.FlickrResponseKeys.Photos] as? [String:AnyObject], let photoArray = photosDictionary[Constants.FlickrResponseKeys.Photo] as? [[String:AnyObject]] {
                        var randomPhotoIndex = Int(arc4random_uniform(UInt32(photoArray.count)))
                        randomPhotoIndex = 0
                        let photoDictionary = photoArray[randomPhotoIndex] as [String:AnyObject]
                        
                        if let imageUrlString = photoDictionary[Constants.FlickrResponseKeys.MediumURL] as? String, let photoTitle = photoDictionary[Constants.FlickrResponseKeys.Title] as? String {
                            let imageURL = URL(string: imageUrlString)
                            if let imageData = try? Data(contentsOf: imageURL!){
                                
                                DispatchQueue.main.async {
                                    self.photoImageView.image = UIImage(data: imageData)
                                    self.photoTitleLabel.text = photoTitle
                                    self.setUI(enabled: true)
                                }
                            }
                            print(imageUrlString)
                            print(photoTitle)
                        }
                    }
                }
            }
        }
        task.resume()
        print(url)
    }
    
    private func escapedParameters(_ parameters: [String:String]) -> String {
        if parameters.isEmpty {
            return ""
        } else {
            var keyValuePairs = [String]()
            for (key, value) in parameters {
                let stringValue = "\(value)"
                let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                keyValuePairs.append(key + "=" + "\(escapedValue!)")
            }
            return "?\(keyValuePairs.joined(separator: "&"))"
        }
    }
}
