//
//  ColorizeTextField.swift
//  TextFieldDelegates
//
//  Created by Kawnayeen on 1/9/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import Foundation
import UIKit

class ColorizeTextField : NSObject, UITextFieldDelegate {
    
    let colors: [String : UIColor ] = [
        "red": UIColor.red,
        "orange": UIColor.orange,
        "yellow": UIColor.yellow,
        "green": UIColor.green,
        "blue": UIColor.blue,
        "brown": UIColor.brown,
        "black": UIColor.black,
        "purple": UIColor.purple,
        "cyan": UIColor.cyan,
        "magenta": UIColor.magenta,
        "white": UIColor.white
    ]
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var colorsInTheText = [UIColor]()
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        for (key, color) in self.colors {
            if newText.range(of: key, options: .caseInsensitive).location != NSNotFound {
                colorsInTheText.append(color)
            }
        }
        
        if colorsInTheText.count > 0 {
            textField.textColor = self.blendColorArray(colorsInTheText)
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func blendColorArray(_ colors: [UIColor]) -> UIColor {
        var colorComponents: [CGFloat] = [CGFloat](repeating: 0.0, count:4)
        for color in colors {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            colorComponents[0] += red
            colorComponents[1] += green
            colorComponents[2] += blue
            colorComponents[3] += alpha
        }
        
        for i in 0...colorComponents.count - 1 {
            colorComponents[i] = colorComponents[i] / CGFloat(colors.count)
        }
        
        return UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3])
    }
}
