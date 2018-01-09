//
//  ViewController.swift
//  TextFieldDelegates
//
//  Created by Kawnayeen on 1/5/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var thirdText: UITextField!
    @IBOutlet weak var charCountLabel: UILabel!
    
    let colorizedDelegate = ColorizeTextField()
    let emojiDelegate = EmojiDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.charCountLabel.isHidden = true
        self.thirdText.delegate = self
        self.secondText.delegate = colorizedDelegate
        self.firstText.delegate = emojiDelegate
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nsString = textField.text as NSString?
        let newString = nsString?.replacingCharacters(in: range, with: string)
        self.charCountLabel.isHidden = (newString!.characters.count == 0)
        self.charCountLabel.text = String(newString!.characters.count)
        return true
    }
}

