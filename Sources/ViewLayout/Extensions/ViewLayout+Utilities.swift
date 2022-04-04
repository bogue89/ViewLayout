//
//  ViewLayout+Utilities.swift
//  ViewLayout
//

import UIKit

public extension ViewLayout {

    // Anchoring relative to edges
    @discardableResult
    func anchor(left: Anchor<HorizontalAnchor>? = nil,
                top: Anchor<VerticalAnchor>? = nil,
                right: Anchor<HorizontalAnchor>? = nil,
                bottom: Anchor<VerticalAnchor>? = nil,
                inset: UIEdgeInsets,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        if let left = left {
            self.left.anchor(to: left.anchor,
                             relationBy: relation,
                             multiplier: multiplier,
                             constant: inset.left,
                             priority: priority,
                             active: true)
        }
        if let top = top {
            self.top.anchor(to: top.anchor,
                            relationBy: relation,
                            multiplier: multiplier,
                            constant: inset.top,
                            priority: priority,
                            active: true)
        }
        if let right = right {
            self.right.anchor(to: right.anchor,
                              relationBy: relation,
                              multiplier: multiplier,
                              constant: -inset.right,
                              priority: priority,
                              active: true)
        }
        if let bottom = bottom {
            self.bottom.anchor(to: bottom.anchor,
                               relationBy: relation,
                               multiplier: multiplier,
                               constant: -inset.bottom,
                               priority: priority,
                               active: true)
        }
        return self
    }

    // Anchoring relative to centers
    @discardableResult
    func anchor(centerX: Anchor<HorizontalAnchor>? = nil,
                centerY: Anchor<VerticalAnchor>? = nil,
                margins: (x: CGFloat, y: CGFloat),
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        if let centerX = centerX {
            self.centerX.anchor(to: centerX.anchor,
                              relationBy: relation,
                                multiplier: multiplier,
                              constant: margins.x,
                              priority: priority,
                              active: true)
        }
        if let centerY = centerY {
            self.centerY.anchor(to: centerY.anchor,
                               relationBy: relation,
                                multiplier: multiplier,
                               constant: margins.y,
                               priority: priority,
                               active: true)
        }
        return self
    }

    // Anchoring relative to sizes
    @discardableResult
    func anchor(width: Anchor<DimensionAnchor>? = nil,
                height: Anchor<DimensionAnchor>? = nil,
                margins: (width: CGFloat, height: CGFloat),
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        if let width = width {
            self.width.anchor(to: width.anchor,
                              relationBy: relation,
                              multiplier: multiplier,
                              constant: margins.width,
                              priority: priority,
                              active: true)
        }
        if let height = height {
            self.height.anchor(to: height.anchor,
                               relationBy: relation,
                               multiplier: multiplier,
                               constant: margins.height,
                               priority: priority,
                               active: true)
        }
        return self
    }

    // MARK: Sizing

    // Anchoring width with absolute values
    @discardableResult
    func setWidth(_ width: CGFloat,
                  relation: Relation = .equal,
                  multiplier: CGFloat = 1,
                  priority: UILayoutPriority = .required) -> ViewLayout {
        self.width.constant = width
        self.width.relation = relation
        self.width.multiplier = multiplier
        self.width.priority = priority
        return self
    }

    // Anchoring height with absolute values
    @discardableResult
    func setHeight(_ height: CGFloat,
                   relation: Relation = .equal,
                   multiplier: CGFloat = 1,
                   priority: UILayoutPriority = .required) -> ViewLayout {
        self.height.constant = height
        self.height.relation = relation
        self.height.multiplier = multiplier
        self.height.priority = priority
        return self
    }

    // Anchoring to many edges at once
    @discardableResult
    func fill(_ layout: ViewLayout,
              edge: UIRectEdge = .all,
              inset: UIEdgeInsets,
              relation: Relation = .equal,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(left: layout.left,
                    top: layout.top,
                    right: layout.right,
                    bottom: layout.bottom,
                    inset: inset,
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
        switch edge {
        case .left:
            self.right.isActive = false
        case .top:
            self.bottom.isActive = false
        case .right:
            self.left.isActive = false
        case .bottom:
            self.top.isActive = false
        default: // case .all
            break;
        }
        return self
    }

    // Animates the changes to view's layout
    func animate(duration: TimeInterval,
                 delay: TimeInterval = 0,
                 damping: CGFloat = 1,
                 velocity: CGFloat = 1,
                 options: UIView.AnimationOptions = .curveLinear,
                 animations: @escaping((ViewLayout) -> ((Bool) -> Void)?)) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: options,
                       animations: {
            self.layout()
        }, completion: animations(self))
    }
    
}
