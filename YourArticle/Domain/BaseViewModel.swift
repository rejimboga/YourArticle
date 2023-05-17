//
//  BaseViewModel.swift
//  YourArticle
//
//  Created by Macbook Air on 15.05.2023.
//

import Foundation

protocol BaseViewModel {
    associatedtype Output: Outputable
    
    var output: Output { get }
}

protocol Outputable {}
