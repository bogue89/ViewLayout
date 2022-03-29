//
//  Utilities.swift
//  ViewLayout
//

import UIKit

public extension ViewLayout {

    @discardableResult
    func anchor(frame: (leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>),
                        rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>)),
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(frame: frame,
                    margins: (margin, margin),
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

    @discardableResult
    func anchor(frame: (leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>),
                        rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>)),
                margins: (horizontal: CGFloat, vertical: CGFloat),
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(frame: frame,
                    inset: UIEdgeInsets(top: margins.vertical,
                                        left: margins.horizontal,
                                        bottom: margins.vertical,
                                        right: margins.horizontal),
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

    @discardableResult
    func anchor(frame: (leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>),
                        rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>)),
                inset: UIEdgeInsets,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(left: frame.leftTop.left,
                    top: frame.leftTop.top,
                    right: frame.rightBottom.right,
                    bottom: frame.rightBottom.bottom,
                    inset: inset,
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

    @discardableResult
    func anchor(horizontal: (`left`: Anchor<HorizontalAnchor>, `right`: Anchor<HorizontalAnchor>),
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(left: horizontal.left,
                    right: horizontal.right,
                    margin: margin,
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

    @discardableResult
    func anchor(vertical: (top: Anchor<VerticalAnchor>, bottom: Anchor<VerticalAnchor>),
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(top: vertical.top,
                    bottom: vertical.bottom,
                    margin: margin,
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

    @discardableResult
    func anchor(left: Anchor<HorizontalAnchor>? = nil,
                top: Anchor<VerticalAnchor>? = nil,
                right: Anchor<HorizontalAnchor>? = nil,
                bottom: Anchor<VerticalAnchor>? = nil,
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(left: left,
                    top: top,
                    right: right,
                    bottom: bottom,
                    margins: (margin, margin),
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

    @discardableResult
    func anchor(left: Anchor<HorizontalAnchor>? = nil,
                top: Anchor<VerticalAnchor>? = nil,
                right: Anchor<HorizontalAnchor>? = nil,
                bottom: Anchor<VerticalAnchor>? = nil,
                margins: (horizontal: CGFloat, vertical: CGFloat),
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(left: left,
                    top: top,
                    right: right,
                    bottom: bottom,
                    inset: UIEdgeInsets(top: margins.vertical,
                                        left: margins.horizontal,
                                        bottom: margins.vertical,
                                        right: margins.horizontal),
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

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

    @discardableResult
    func anchor(centerX: Anchor<HorizontalAnchor>? = nil,
                centerY: Anchor<VerticalAnchor>? = nil,
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        self.anchor(centerX: centerX,
                    centerY: centerY,
                    margins: (margin, margin),
                    relation: relation,
                    multiplier: multiplier,
                    priority: priority)
    }

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

    @discardableResult
    func anchor(size: (width: Anchor<DimensionAnchor>, height: Anchor<DimensionAnchor>),
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        anchor(width: size.width,
               height: size.height,
               margins: (margin, margin),
               relation: relation,
               multiplier: multiplier,
               priority: priority)
    }

    @discardableResult
    func anchor(size: (width: Anchor<DimensionAnchor>, height: Anchor<DimensionAnchor>),
                margins: (width: CGFloat, height: CGFloat),
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        anchor(width: size.width,
               height: size.height,
               margins: margins,
               relation: relation,
               multiplier: multiplier,
               priority: priority)
    }

    @discardableResult
    func anchor(width: Anchor<DimensionAnchor>? = nil,
                height: Anchor<DimensionAnchor>? = nil,
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        anchor(width: width,
               height: height,
               margins: (margin, margin),
               relation: relation,
               multiplier: multiplier,
               priority: priority)
    }

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

    // MARK: Sizing shortcuts
    @discardableResult
    func setSize(_ size: CGFloat,
                 relation: Relation = .equal,
                 multiplier: CGFloat = 1,
                 priority: UILayoutPriority = .required) -> ViewLayout {
        setSize(size, size,
                relation: relation,
                multiplier: multiplier,
                priority: priority)
    }

    @discardableResult
    func setSize(_ size: CGSize,
                 relation: Relation = .equal,
                 multiplier: CGFloat = 1,
                 priority: UILayoutPriority = .required) -> ViewLayout {
        setSize(size.width, size.height,
                relation: relation,
                multiplier: multiplier,
                priority: priority)
    }

    @discardableResult
    func setSize(_ width: CGFloat,
                 _ height: CGFloat,
                 relation: Relation = .equal,
                 multiplier: CGFloat = 1,
                 priority: UILayoutPriority = .required) -> ViewLayout {
        setWidth(width,
                  relation: relation,
                  multiplier: multiplier,
                  priority: priority)
        setHeight(height,
                  relation: relation,
                  multiplier: multiplier,
                  priority: priority)
        return self
    }

    @discardableResult
    func setWidth(_ width: CGFloat,
                  relation: Relation = .equal,
                  multiplier: CGFloat = 1,
                  priority: UILayoutPriority = .required) -> ViewLayout {
        self.width.anchor(to: self.width.anchor,
                          relationBy: relation,
                          multiplier: multiplier,
                          constant: width,
                          priority: priority,
                          active: true)
        return self
    }

    @discardableResult
    func setHeight(_ height: CGFloat,
                   relation: Relation = .equal,
                   multiplier: CGFloat = 1,
                   priority: UILayoutPriority = .required) -> ViewLayout {
        self.height.anchor(to: self.height.anchor,
                           relationBy: relation,
                           multiplier: multiplier,
                           constant: height,
                           priority: priority,
                           active: true)
        return self
    }

}
