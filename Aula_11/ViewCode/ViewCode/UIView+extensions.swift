//
//  UIView+extensions.swift
//  ViewCode
//
//  Created by Idwall Go Dev 008 on 23/03/22.
//

import Foundation
import UIKit

extension UIView {
    public func addSubViews(_ subview: UIView...) {
        subview.forEach(addSubview)
    }
}
