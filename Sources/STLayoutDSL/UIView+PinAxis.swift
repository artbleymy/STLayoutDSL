//
//  UIView+PinAxis.swift
//  
//
//  Created by Stanislav Kozlov on 10.04.2023.
//

import UIKit

public extension UIView {
    
    enum Axis {
        case vertical(CGFloat = 0)
        case horizontal(CGFloat = 0)
    }
    
    @discardableResult
    func pinAxesTo(
        _ view: UIView,
        axes: [Axis] = [.horizontal(), .vertical()]
    ) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = axes.map {
            switch $0 {
            case let .vertical(offset):
                return centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset)
            case let .horizontal(offset):
                return centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset)
            }
        }
        NSLayoutConstraint.activate(constraints)
        
        return self
    }
    
    @discardableResult
    func pinAxesToSuperview(
        _ axes: [Axis] = [.horizontal(), .vertical()]
    ) -> UIView {
        guard let superview else {
            fatalError("View doesn't have superview")
        }
        
        pinAxesTo(superview, axes: axes)
        
        return self
    }
}
