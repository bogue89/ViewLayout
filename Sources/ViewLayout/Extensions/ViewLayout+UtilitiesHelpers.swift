//
//  ViewLayout+UtilitiesHelpers.swift
//  
//
//  Created by Jorge Benavides
//

import UIKit

// method extensions to extend access to ViewLayout+Utilities.swift
public extension ViewLayout {

    @discardableResult
    func anchor(frame: (leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>),
                        rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>)),
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        anchor(frame: frame,
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
        anchor(frame: frame,
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
        anchor(left: frame.leftTop.left,
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
        anchor(left: horizontal.left,
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
        anchor(top: vertical.top,
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
        anchor(left: left,
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
        anchor(left: left,
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
    func anchor(centerX: Anchor<HorizontalAnchor>? = nil,
                centerY: Anchor<VerticalAnchor>? = nil,
                margin: CGFloat = 0,
                relation: Relation = .equal,
                multiplier: CGFloat = 1,
                priority: UILayoutPriority = .required) -> ViewLayout {
        anchor(centerX: centerX,
               centerY: centerY,
               margins: (margin, margin),
               relation: relation,
               multiplier: multiplier,
               priority: priority)
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
    func fill(edge: UIRectEdge = .all,
              margin: CGFloat = 0,
              relation: Relation = .equal,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required) -> ViewLayout {
        fill(superview().layout,
             edge: edge,
             margin: margin,
             relation: relation,
             multiplier: multiplier,
             priority: priority)
        return self
    }

    @discardableResult
    func fill(_ layout: ViewLayout,
              edge: UIRectEdge = .all,
              margin: CGFloat = 0,
              relation: Relation = .equal,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required) -> ViewLayout {
       fill(layout,
            edge: edge,
            margins: (margin, margin),
            relation: relation,
            multiplier: multiplier,
            priority: priority)
        return self
    }

    @discardableResult
    func fill(edge: UIRectEdge = .all,
              margins: (horizontal: CGFloat, vertical: CGFloat),
              relation: Relation = .equal,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required) -> ViewLayout {
        fill(superview().layout,
             edge: edge,
             margins: margins,
             relation: relation,
             multiplier: multiplier,
             priority: priority)
        return self
    }

    @discardableResult
    func fill(_ layout: ViewLayout,
              edge: UIRectEdge = .all,
              margins: (horizontal: CGFloat, vertical: CGFloat),
              relation: Relation = .equal,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required) -> ViewLayout {
        fill(layout,
             edge: edge,
             inset: UIEdgeInsets(top: margins.vertical,
                                 left: margins.horizontal,
                                 bottom: margins.vertical,
                                 right: margins.horizontal),
             relation: relation,
             multiplier: multiplier,
             priority: priority)
        return self
    }

    @discardableResult
    func fill(edge: UIRectEdge = .all,
              inset: UIEdgeInsets,
              relation: Relation = .equal,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required) -> ViewLayout {
        fill(superview().layout,
             edge: edge,
             inset: inset,
             relation: relation,
             multiplier: multiplier,
             priority: priority)
        return self
    }

    // Animates the changes to view's layout
    func animate(duration: TimeInterval,
                 delay: TimeInterval = 0,
                 damping: CGFloat = 1,
                 velocity: CGFloat = 1,
                 options: UIView.AnimationOptions = .curveLinear,
                 animations: ((ViewLayout) -> Void)? = nil) {
        animate(duration: duration,
                delay: delay,
                damping: damping,
                velocity: velocity,
                options: options,
                animations: { layout in
                    animations?(layout)
                    return nil
                })
    }

}
