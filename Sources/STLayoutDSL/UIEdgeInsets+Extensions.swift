//
//  UIEdgeInsets+Extensions.swift
//  
//
//  Created by Stanislav Kozlov on 10.04.2023.
//

import UIKit

public extension UIEdgeInsets {
    init(
        top: CGFloat = 0,
        bottom: CGFloat = 0,
        left: CGFloat = 0,
        right: CGFloat = 0
    ) {
        self = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    init(
        horizontalInset: CGFloat = 0,
        verticalInset: CGFloat = 0
    ) {
        self = UIEdgeInsets(
            top: verticalInset,
            left: horizontalInset,
            bottom: verticalInset,
            right: horizontalInset
        )
    }
}
