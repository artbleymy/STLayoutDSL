//
//  AxisConstraint.swift
//  
//
//  Created by Stanislav Kozlov on 08.08.2023.
//

import UIKit

public struct AxisConstraint {
    public enum AxisType {
        case horizontal
        case vertical
    }
    
    let type: AxisType
    let offset: CGFloat
    
    public init(
        _ type: AxisType,
        offset: CGFloat = 0
    ) {
        self.type = type
        self.offset = offset
    }
}
