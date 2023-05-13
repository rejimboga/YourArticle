//
//  UIView+Extension.swift
//  YourArticle
//
//  Created by Macbook Air on 13.05.2023.
//

import UIKit

extension UIView {
    
    //MARK: - Filling UIView
    @discardableResult
    func fill(with childView: UIView, safeArea: Bool = false, padding: UIEdgeInsets = .zero) -> Self {
        addSubview(childView)
        childView.disableTranslates()
        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: safeArea ? safeAreaLayoutGuide.leadingAnchor : leadingAnchor, constant: padding.left),
            childView.trailingAnchor.constraint(equalTo: safeArea ? safeAreaLayoutGuide.trailingAnchor : trailingAnchor, constant: -padding.right),
            childView.topAnchor.constraint(equalTo: safeArea ? safeAreaLayoutGuide.topAnchor : topAnchor, constant: padding.top),
            childView.bottomAnchor.constraint(equalTo: safeArea ? safeAreaLayoutGuide.bottomAnchor : bottomAnchor, constant: -padding.bottom)
        ])
        
        return self
    }
    
    
    @discardableResult
    func disableTranslates() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    // MARK: - UIView
    @discardableResult
    func backgroundColor(_ value: UIColor) -> Self {
        backgroundColor = value
        return self
    }
    
    @discardableResult
    func frame(_ value: CGRect) -> Self {
        frame = value
        return self
    }
    
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        alpha = value
        return self
    }
    
    @discardableResult
    func tintColor(_ value: UIColor) -> Self {
        tintColor = value
        return self
    }
    
    @discardableResult
    func addSubviews(_ subviews: [UIView]) -> Self {
        subviews.forEach({ addSubview($0) })
        return self
    }
    
    // MARK: - Layer
    @discardableResult
    func masksToBounds(_ value: Bool) -> Self {
        layer.masksToBounds = value
        return self
    }
    
    @discardableResult
    func clipToBounds(_ value: Bool) -> Self {
        clipsToBounds = value
        return self
    }
    
    @discardableResult
    func border(_ color: UIColor, width: CGFloat) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self.masksToBounds(false)
    }
    
    @discardableResult
    func removeBorder() -> Self {
        layer.borderWidth = 0
        return self
    }
    
    @discardableResult
    func cornerRadius(_ value: CGFloat, maskedCorners: CACornerMask? = nil) -> Self {
        layer.cornerRadius = value
        if let maskedCorners { layer.maskedCorners = maskedCorners }
        return self
    }
    
    // MARK: - Constraints
    enum ConstraintType {
        case equal
        case greaterOrEqual
        case lessOrEqueal
    }
    
    @discardableResult
    func height(_ value: CGFloat, type: ConstraintType = .equal) -> Self {
        disableTranslates()
        switch type {
        case .equal:
            heightAnchor.constraint(equalToConstant: value).isActive = true
        case .greaterOrEqual:
            heightAnchor.constraint(greaterThanOrEqualToConstant: value).isActive = true
        case .lessOrEqueal:
            heightAnchor.constraint(lessThanOrEqualToConstant: value).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func width(_ value: CGFloat, type: ConstraintType = .equal) -> Self {
        disableTranslates()
        switch type {
        case .equal:
            widthAnchor.constraint(equalToConstant: value).isActive = true
        case .greaterOrEqual:
            widthAnchor.constraint(greaterThanOrEqualToConstant: value).isActive = true
        case .lessOrEqueal:
            widthAnchor.constraint(lessThanOrEqualToConstant: value).isActive = true
        }
        return self
    }
    
    @discardableResult
    func square(_ side: CGFloat) -> Self {
        disableTranslates()
        return self
            .height(side)
            .width(side)
    }
    
    func fixSides(to view: UIView, constant: CGFloat) {
        disableTranslates()
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant)
        ])
    }
}

