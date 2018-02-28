//
//  Constants.swift
//  SleepingInTheLibrary
//
//  Created by Kawnayeen on 2/7/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Flickr {
        static let BASE_URL = "https://api.flickr.com/services/rest/"
    }
    
    struct FlickrParameterKeys {
        static let METHOD = "method"
        static let API_KEY = "api_key"
        static let GALLERY_ID = "gallery_id"
        static let EXTRAS = "extras"
        static let FORMAT = "format"
        static let NO_JSON_CALLBACK = "nojsoncallback"
    }
    
    struct FlickrParameterValues {
        static let API_KEY = "237e5bfdc15ca6c6229896a4db879b88"
        static let ResponseFormat = "json"
        static let DisableJSONCallback = "1"
        static let GalleryPhotoMethod = "flickr.galleries.getPhotos"
        static let GalleryId = "5704-72157622566655097"
        static let MediumURL = "url_m"
    }
    
    // MARK: Flickr Response Keys
    struct FlickrResponseKeys {
        static let Status = "stat"
        static let Photos = "photos"
        static let Photo = "photo"
        static let Title = "title"
        static let MediumURL = "url_m"
    }
    
    // MARK: Flickr Response Values
    struct FlickrResponseValues {
        static let OKStatus = "ok"
    }
}
