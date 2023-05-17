//
//  UITableView+Extension.swift
//  YourArticle
//
//  Created by Macbook Air on 14.05.2023.
//

import UIKit

extension UITableView {
    
    @discardableResult
    func dataSource(_ value: UITableViewDataSource?) -> Self {
        dataSource = value
        return self
    }
    
    @discardableResult
    func delegate(_ value: UITableViewDelegate?) -> Self {
        delegate = value
        return self
    }
    
    @discardableResult
    func rowHeight(_ value: CGFloat) -> Self {
        rowHeight = value
        return self
    }
    
    @discardableResult
    func register(_ cellClass: AnyClass?, id: String) -> Self {
        register(cellClass, forCellReuseIdentifier: id)
        return self
    }
    
    @discardableResult
    func register(_ nib: UINib?, id: String) -> Self {
        register(nib, forCellReuseIdentifier: id)
        return self
    }
    
    @discardableResult
    func separatorColor(_ value: UIColor) -> Self {
        separatorColor = value
        return self
    }
    
    @discardableResult
    func separatorStyle(_ value: UITableViewCell.SeparatorStyle) -> Self {
        separatorStyle = value
        return self
    }
}
