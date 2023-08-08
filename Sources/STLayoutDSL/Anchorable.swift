//
//  Anchorable.swift
//  
//
//  Created by Stanislav Kozlov on 08.08.2023.
//

import UIKit

public protocol Anchorable {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
}

extension UIView: Anchorable { }

extension UILayoutGuide: Anchorable { }
