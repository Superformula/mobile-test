//
//  Extensions.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import UIKit

//MARK: - UITableViewCell
extension UITableViewCell {
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
}

//MARK: - UIViewController
extension UIViewController {
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    static func navIdentifier() -> String {
        return String(describing: self).replacingOccurrences(of: "VC", with: "Nav")
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self) + "Cell"
    }
    static func storyboardIdentifier() -> String {
        return String(describing: self).replacingOccurrences(of: "VC", with: "")
    }
    
    func displayAlertController(withAlertStyle alertStyle:UIAlertController.Style, withTitle title:String?, withMesssage message:String?, withActions actions:[UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for action in actions {
            alert.addAction(action)
        }
        if actions.count < 1 {
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        }
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - UIColor
extension UIColor {
    
    class func colorFromHex(hexString: String) -> UIColor {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
