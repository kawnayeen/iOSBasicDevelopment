//
//  EmojiDelegate.swift
//  TextFieldDelegates
//
//  Created by Kawnayeen on 1/9/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import Foundation
import UIKit

class EmojiDelegate : NSObject, UITextFieldDelegate {
    
    let emojiTranslation : [String : String ] = [
        "love" : "\u{0001F496}",
        "fish" : "\u{E522}",
        "bird" : "\u{E523}",
        "frog" : "\u{E531}",
        "brear" : "\u{E527}",
        "dog" : "\u{E052}",
        "cat" : "\u{E04F}"
    ]
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var replacedAnEmoji = false
        var emojiStringRange: NSRange
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        for(emojiString, emoji) in emojiTranslation {
            repeat {
                emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
                if emojiStringRange.location != NSNotFound {
                    newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
                    replacedAnEmoji = true
                }
            }while emojiStringRange.location != NSNotFound
        }
        
        if replacedAnEmoji {
            textField.text = newText as String
            return false
        }else {
            return true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
