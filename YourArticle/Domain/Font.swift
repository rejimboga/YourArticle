//
//  Font.swift
//  YourArticle
//
//  Created by Macbook Air on 17.05.2023.
//

import UIKit

enum Font {
    
    case bold(size: CGFloat)
    case semibold(size: CGFloat)
    
    var fontValue: UIFont {
        switch self {
        case .bold(let size):
            return UIFont(name: "ProximaNova-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
        case .semibold(let size):
            return UIFont(name: "ProximaNova-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}
