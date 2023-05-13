//
//  UIButton+Extension.swift
//  YourArticle
//
//  Created by Macbook Air on 13.05.2023.
//

import UIKit

extension UIButton {
    
    @discardableResult
    func text(_ value: String) -> Self {
        setTitle(value, for: .normal)
        return self
    }
    
    @discardableResult
    func font(_ value: UIFont) -> Self {
        titleLabel?.font(value)
        return self
    }
    
    @discardableResult
    func textColor(_ value: UIColor) -> Self {
        setTitleColor(value, for: .normal)
        return self
    }
    
    @discardableResult
    func underline(_ value: Bool) -> Self {
        setAttributedTitle(NSAttributedString(string: titleLabel?.text ?? "", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]), for: .normal)
        return self
    }
    
    @discardableResult
    func addTarget(_ target: Any?, selector: Selector, event: Event) -> Self {
        addTarget(target, action: selector, for: event)
        return self
    }
}


