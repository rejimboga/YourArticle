//
//  UIImageView+Extension.swift
//  YourArticle
//
//  Created by Macbook Air on 17.05.2023.
//

import UIKit

extension UIImageView {
    
    @discardableResult
    func contentMode(_ value: ContentMode) -> Self {
        contentMode = value
        return self
    }
}
