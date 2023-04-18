//
//  UIView+PinDimension.swift
//  
//
//  Created by Stanislav Kozlov on 10.04.2023.
//

import UIKit

public extension UIView {
    
    enum Dimension {
        case width(CGFloat = 1)
        case height(CGFloat = 1)
    }
    
    /// Set dimension constraint
    ///
    /// To setup size in points
    /// ```
    /// subview.setDimension([.height(70), .width(50)])
    /// ```
    /// To setup size as multiplier for other view dimension
    /// ```
    /// subview.setDimension([.height(1), .width(2)], to: view)
    /// ```
    ///
    /// - Parameter dimensions: array of dimensions for set. Possible values: `.height()`, `.width()`
    /// Assosiated value is the size or multiplier(if relations with other view needed)
    /// - Parameter view: to set multiplier between different views dimensions
    /// - Returns: Current pinned view
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
    
    /// Set square dimension constraint
    ///
    /// - Parameter square: square side size
    /// - Returns: Current pinned view
    @discardableResult
    func setDimension(
        square: CGFloat
    ) -> UIView {
        return setDimension([.width(square), .height(square)])
    }
    
}

