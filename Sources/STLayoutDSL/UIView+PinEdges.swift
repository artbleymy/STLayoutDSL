//
//  UIView+Extensions.swift
//  
//
//  Created by Stanislav Kozlov on 07.04.2023.
//

import UIKit

public extension UIView {
    /// Pin edges of current view to the target view
    ///
    /// By default pin edge to the same edge of
    /// the target view. For example left to left, top to top etc.
    /// For customizing offset and target edge,
    /// custom values can be passed in assosiated values.
    /// ```
    /// subview.pinEdgesTo(view, [.init(.leading, offset: 20), .init(.trailing, offset: 20)])
    /// ```
    ///
    /// - Parameter view: target view
    /// - Parameter edges: array of edges which should be pinned.`
    ///- Returns: Current pinned view
    @discardableResult
    func pinEdges(
        to view: Anchorable,
        edges: [EdgeConstraint]
    ) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = edges.map {
            switch $0.type {
            case .top:
                let targetAnchor = $0.targetType == .bottom ? view.bottomAnchor : view.topAnchor
                return topAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: $0.offset
                )
            case .bottom:
                let targetAnchor = $0.targetType == .top ? view.topAnchor : view.bottomAnchor
                return bottomAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: $0.offset
                )
            case .leading:
                let targetAnchor = $0.targetType == .trailing ? view.trailingAnchor : view.leadingAnchor
                return leadingAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: $0.offset
                )
            case .trailing:
                let targetAnchor = $0.targetType == .leading ? view.leadingAnchor : view.trailingAnchor
                return trailingAnchor.constraint(
                    equalTo: targetAnchor,
                    constant: $0.offset
                )
            }
        }
        NSLayoutConstraint.activate(constraints)
        
        return self
    }
    
    /// Pin edges of current view to the target view
    ///
    /// By default pin edge to the same edge of
    /// the target view. For example left to left, top to top etc.
    /// For customizing offset and target edge,
    /// custom values can be passed in assosiated values.
    /// ```
    /// subview.pinEdgesTo(view, [.init(.leading, offset: 20), .init(.trailing, offset: 20)])
    /// ```
    ///
    /// - Parameter view: target view
    /// - Parameter edgeTypes: array of edges types which should be pinned. Pin all edges by default`
    ///- Returns: Current pinned view
    @discardableResult
    func pinEdges(
        to view: UIView,
        edgeTypes: [EdgeConstraint.EdgeType] = [.top, .bottom, .leading, .trailing]
    ) -> UIView {
        pinEdges(to: view, edges: edgeTypes.map { EdgeConstraint($0) })
    }
    
    /// Pin edges of current view to the superview
    ///
    /// ```
    /// subview.pinEdgesToSuperview([.init(.leading, offset: 20), .init(.trailing, offset: 20)])
    /// ```
    ///
    /// - Parameter edges: array of edges which should be pinned.`
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if  superview not exists
    ///
    @discardableResult
    func pinEdgesToSuperview(
        _ edges: [EdgeConstraint]
    ) -> UIView {
        guard let superview else {
            fatalError("View doesn't have superview")
        }
        
        return pinEdges(to: superview, edges: edges)
    }
    
    /// Pin edges of current view to the superview
    ///
    /// ```
    /// subview.pinEdgesToSuperview([.leading, .trailing])
    /// ```
    ///
    /// - Parameter edges: array of edges types which should be pinned.`
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if  superview not exists
    ///
    @discardableResult
    func pinEdgesToSuperview(
        _ edgeTypes: [EdgeConstraint.EdgeType] = [.leading, .trailing, .top, .bottom]
    ) -> UIView {
        pinEdgesToSuperview(edgeTypes.map { EdgeConstraint($0) })
    }
    
    /// Pin edges of current view to the superview safe area
    ///
    /// ```
    /// subview.pinEdgesToSafeArea([.init(.leading, offset: 20), .init(.trailing, offset: 20)])
    /// ```
    ///
    /// - Parameter edges: array of edges which should be pinned. Pin all edges by default
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if  superview not exists
    ///
    @discardableResult
    func pinEdgesToSafeArea(
        _ edges: [EdgeConstraint]
    ) -> UIView {
        guard let superview else {
            fatalError("View doesn't have superview")
        }
        
        return pinEdges(to: superview.safeAreaLayoutGuide, edges: edges)
    }
    
    /// Pin edges of current view to the superview
    ///
    /// By default pin edge to the same edge of the safe area. For example left to left, top to top etc.
    /// ```
    /// subview.pinEdgesToSafeArea([.leading, .trailing])
    /// ```
    ///
    /// - Parameter edges: array of edges which should be pinned. Pin all edges by default
    /// - Returns: current pinned view
    /// - Throws: Can throw Fatal error  if  superview not exists
    ///
    @discardableResult
    func pinEdgesToSafeArea(
        _ edgeTypes: [EdgeConstraint.EdgeType]
    ) -> UIView {
        pinEdgesToSafeArea(edgeTypes.map { EdgeConstraint($0) })
    }
}
