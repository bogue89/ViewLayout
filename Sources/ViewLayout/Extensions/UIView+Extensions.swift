//
//  UIView+Extensions.swift
//  ViewLayout
//

import UIKit

public extension UIView {
    /// gets or create the layout constraint class for this particular view
    unowned var layout: ViewLayout { ViewLayout.instance(for: self) }
}
