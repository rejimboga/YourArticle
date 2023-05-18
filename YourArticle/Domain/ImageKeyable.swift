//
//  ImageKeyable.swift
//  YourArticle
//
//  Created by Macbook Air on 17.05.2023.
//

import UIKit

protocol ImageKeyable {
    var image: UIImage? { get }
}

extension UIImage {
    enum CommonKey: String, ImageKeyable {
        
        var image: UIImage? {
            UIImage(named: self.rawValue)
        }
        
        case empty = "empty_bookmark"
        case filled = "filled_bookmark"
    }
}
