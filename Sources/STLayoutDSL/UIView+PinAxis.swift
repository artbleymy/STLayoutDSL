//
//  UIView+PinAxis.swift
//  
//
//  Created by Stanislav Kozlov on 10.04.2023.
//

import UIKit

public extension UIView {
    /// Pin axes of current view to the target view
    /// - Parameters:
    ///   - view: target view
    ///   - axes: array of axes that should be pinned to targe view.`
    /// - Returns: current pinned view
    @discardableResult
    func pinAxes(
        to view: UIView,
        axes: [AxisConstraint]
    ) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = axes.map {
            switch $0.type {
            case .vertical:
                return centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: $0.offset)
            case .horizontal:
                return centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: $0.offset)
            }
        }
        NSLayoutConstraint.activate(constraints)
        
        return self
    }

    /// Pin axes of current view to the target view
    /// - Parameters:
    ///   - view: target view
    ///   - axes: array of axes types that should be pinned to targe view. Default value: [.horizontal, .vertical] (pin to center of parent view)`
    /// - Returns: current pinned view
    @discardableResult
    func pinAxes(
        to view: UIView,
        axisTypes: [AxisConstraint.AxisType] = [.horizontal, .vertical]
    ) -> UIView {
        pinAxes(to: view, axes: axisTypes.map { AxisConstraint($0) })
    }
    
    /// Pin axes of current view to the superview
    /// 
    /// - Parameters:
    ///   - axes: array of axes that should be pinned to superview.`
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if there are no superview
    @discardableResult
    func pinAxesToSuperview(
        _ axes: [AxisConstraint]
    ) -> UIView {
        guard let superview else {
            fatalError("View doesn't have superview")
        }
        
        return pinAxes(to: superview, axes: axes)
    }
    
    /// Pin axes of current view to the superview
    ///
    /// - Parameters:
    ///   - axes: array of axes types that should be pinned to superview. Default value: [.horizontal, .vertical] (pin to center of superview)`
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if there are no superview
    @discardableResult
    func pinAxesToSuperview(
        _ axisTypes: [AxisConstraint.AxisType] = [.horizontal, .vertical]
    ) -> UIView {
        guard let superview else {
            fatalError("View doesn't have superview")
        }
        
        return pinAxes(to: superview, axes: axisTypes.map { AxisConstraint($0) })
    }
}
