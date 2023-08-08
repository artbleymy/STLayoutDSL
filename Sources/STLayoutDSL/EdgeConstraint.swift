//
//  EdgeConstraint.swift
//  
//
//  Created by Stanislav Kozlov on 08.08.2023.
//

import UIKit

public struct EdgeConstraint {
    public enum EdgeType {
        case top
        case bottom
        case leading
        case trailing
    }
    
    let type: EdgeType
    let offset: CGFloat
    let inset: CGFloat
    let targetType: EdgeType
    
    public init(
        _ type: EdgeType,
        offset: CGFloat = 0,
        targetType: EdgeType? = nil
    ) {
        self.type = type
        self.offset = offset
        switch type {
        case .leading, .top:
            self.inset = offset
        case .trailing, .bottom:
            self.inset = -offset
        }
        self.targetType = targetType ?? type
    }
    
    public init(
        _ type: EdgeType,
        inset: CGFloat,
        targetType: EdgeType? = nil
    ) {
        self.type = type
        self.inset = inset
        switch type {
        case .leading, .top:
            self.offset = inset
        case .trailing, .bottom:
            self.offset = -inset
        }
        self.targetType = targetType ?? type
    }
}
