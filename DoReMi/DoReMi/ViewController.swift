//
//  ViewController.swift
//  DoReMi
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource

class ViewController: UIViewController, UITableViewDataSource {

    // MARK: Properties
    
    // Use this string property as your reuse identifier, 
    // Storyboard has been set up for you using this String.
    let cellReuseIdentifier = "MyCellReuseIdentifier"
    
    @IBOutlet weak var myTableView: UITableView!
    // Choose some data to show in your table
    
    let model : [[String:String]] = [
        ["text": "Munshi Danesh Ali", "detail" : "Father"],
        ["text": "Azizur Rahman", "detail" : "Son"],
        ["text": "Badrul Islam", "detail": "Grandson"],
        ["text": "Kamarul Kawnayeen", "detail": "Great GrandSon"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.tableFooterView = UIView()
        myTableView.estimatedSectionFooterHeight = 0.0
    }
    
    // MARK: UITableViewDataSource
    
    // Add the two essential table data source methods here
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Implement method to return the correct number of rows.
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier)!
        let dictionary = self.model[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = dictionary["text"]
        cell.detailTextLabel?.text = dictionary["detail"]
        return cell
    }
}
