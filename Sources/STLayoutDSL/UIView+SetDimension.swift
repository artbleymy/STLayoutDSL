//
//  UIView+PinDimension.swift
//  
//
//  Created by Stanislav Kozlov on 10.04.2023.
//

import UIKit

public extension UIView {
    
    enum Dimension {
        case width(CGFloat = 0)
        case height(CGFloat = 0)
    }
    
    @discardableResult
    func setDimension(
        _ dimensions: [Dimension],
        to view: UIView? = nil
    ) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = dimensions.map {
            switch $0 {
            case let .width(dimension):
                if let view {
                    return widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: dimension)
                } else {
                    return widthAnchor.constraint(equalToConstant: dimension)
                }
                
            case let .height(dimension):
                if let view {
                    return heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: dimension)
                } else {
                    return heightAnchor.constraint(equalToConstant: dimension)
                }
            }
        }
        NSLayoutConstraint.activate(constraints)
        
        return self
    }
    
    @discardableResult
    func setDimension(
        square: CGFloat
    ) -> UIView {
        return setDimension([.width(square), .height(square)])
    }
    
}

