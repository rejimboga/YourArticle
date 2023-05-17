//
//  UILabel+Extension.swift
//  YourArticle
//
//  Created by Macbook Air on 13.05.2023.
//

import UIKit

extension UILabel {
    
    @discardableResult
    func font(_ value: Font) -> Self {
        font = value.fontValue
        return self
    }
    
    @discardableResult
    func text(_ value: String?) -> Self {
        text = value
        return self
    }
    
    @discardableResult
    func textColor(_ value: UIColor) -> Self {
        textColor = value
        return self
    }
    
    @discardableResult
    func alignment(_ value: NSTextAlignment) -> Self {
        textAlignment = value
        return self
    }
    
    @discardableResult
    func numberOfLines(_ value: Int) -> Self {
        numberOfLines = value
        return self
    }
}


