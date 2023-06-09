//
//  UIView+Extensions.swift
//  
//
//  Created by Stanislav Kozlov on 07.04.2023.
//

import UIKit

public extension UIView {
    
    enum Edge: Hashable {
        case left(CGFloat = 0, to: EdgeWithoutValue = .left)
        case right(CGFloat = 0, to: EdgeWithoutValue = .right)
        case top(CGFloat = 0, to: EdgeWithoutValue = .top)
        case bottom(CGFloat = 0, to: EdgeWithoutValue = .bottom)
        
        var inverted: Edge {
            switch self {
            case let .left(offset, to: targetEdge):
                return .left(-offset, to: targetEdge)
            case let .right(offset, to: targetEdge):
                return .right(-offset, to: targetEdge)
            case let .top(offset, to: targetEdge):
                return .top(-offset, to: targetEdge)
            case let .bottom(offset, to: targetEdge):
                return .bottom(-offset, to: targetEdge)
            }
        }
    }
    
    enum EdgeWithoutValue {
        case left
        case right
        case top
        case bottom
    }

    
    /// Pin edges of current view to the target view
    ///
    /// By default pin edge to the same edge of
    /// the target view. For example left to left, top to top etc.
    /// For customizing offset and target edge,
    /// custom values can be passed in assosiated values.
    /// ```
    /// subview.pinEdgesTo(view, [.left(20), .right(20), .top(20, .bottom)])
    /// ```
    ///
    /// - Parameter view: target view
    /// - Parameter edges: array of edges which should be pinned. Possible values: `left()`, `right()`, `top()`, `bottom()`
    ///- Returns: Current pinned view
     
    @discardableResult
    func pinEdgesTo(
        _ view: UIView,
        edges: [Edge] = [.top(), .bottom(), .left(), .right()]
    ) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = edges.map {
            switch $0 {
            case let .top(offset, targetEdge):
                let targetAnchor = targetEdge == .bottom ? view.bottomAnchor : view.topAnchor
                let offset = targetEdge == .bottom ? offset : -offset
                return topAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: offset
                )
            case let .bottom(offset, targetEdge):
                let targetAnchor = targetEdge == .top ? view.topAnchor : view.bottomAnchor
                let offset = targetEdge == .top ? -offset : offset
                return bottomAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: offset
                )
            case let .left(offset, targetEdge):
                let targetAnchor = targetEdge == .right ? view.trailingAnchor : view.leadingAnchor
                let offset = targetEdge == .right ? offset : -offset
                return leadingAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: offset
                )
            case let .right(offset, targetEdge):
                let targetAnchor = targetEdge == .left ? view.leadingAnchor : view.trailingAnchor
                let offset = targetEdge == .left ? -offset : offset
                return trailingAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: offset
                )
            }
        }
        NSLayoutConstraint.activate(constraints)
        
        return self
    }
    
    /// Pin edges of current view to the superview
    ///
    ///   By default pin edge to the same edge of the superview view. For example left to left, top to top etc.
    ///   For customizing offset and target edge, custom values can be passed in assosiated values.
    ///
    /// ```
    /// subview.pinEdgesToSuperview([.left(20), .right(20), .top(20, .bottom)])
    /// ```
    /// 
    /// - Parameter edges: array of edges which should be pinned. Possible values: `left()`, `right()`, `top()`, `bottom()`
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if  superview not exists
    ///
    @discardableResult
    func pinEdgesToSuperview(
        _ edges: [Edge] = [.top(), .bottom(), .left(), .right()]
    ) -> UIView {
        guard let superview else {
            fatalError("View doesn't have superview")
        }
        pinEdgesTo(superview, edges: edges.map { $0.inverted })
        
        return self
    }
    
    /// Pin edges of current view to the superview
    ///
    /// By default pin edge to the same edge of the safe area. For example left to left, top to top etc.
    /// For customizing offset and target edge, custom values can be passed in assosiated values.
    /// ```
    /// subview.pinEdgesToSafeArea([.left(20), .right(20), .top(20, .bottom)])
    /// ```
    ///
    /// - Parameter edges: array of edges which should be pinned. Possible values: `left()`, `right()`, `top()`, `bottom()`
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if  superview not exists
    ///
    @discardableResult
    func pinEdgesToSafeArea(
        _ edges: [Edge] = [.top(), .bottom(), .left(), .right()]
    ) -> UIView {
        guard let superview else {
            fatalError("View doesn't have superview")
        }
        let safeArea = superview.safeAreaLayoutGuide.view(superview: superview)
        safeArea.addSubview(self)
        pinEdgesTo(safeArea, edges: edges.map { $0.inverted })
        
        return self
    }
}
