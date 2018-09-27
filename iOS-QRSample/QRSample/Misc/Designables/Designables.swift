//
//  Designables.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable public class RoundedButton: UIButton {
    
    //MARK: - Properties
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    //MARK: - ViewLifeCycle
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
    }
    
}

@IBDesignable public class RoundedView: UIView {
    
    //MARK: - Properties
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    //MARK: - LifeCycle
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
    }
    
}

@IBDesignable public class BorderView: UIView {
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}
