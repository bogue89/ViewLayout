//
//  ViewLayout+Anchor.swift
//  ViewLayout
//

import UIKit

public class Anchor<T: AnyObject> {

    private let _anchor: NSLayoutAnchor<T>
    private var _constraint: Constraint

    public init(_ anchor: NSLayoutAnchor<T>) {
        self._anchor = anchor
        self._constraint = Constraint(anchor.constraint(equalTo: anchor),
                                      toItem: nil)
    }

    public var anchor: NSLayoutAnchor<T> {
        get { _anchor }
        set {
            let constraint = newValue.constraint(equalTo: anchor)
            _constraint.constraint = Constraint(constraint).constraint
        }
    }

    public var constraint: Constraint {
        _constraint
    }

    public var item: AnyObject? {
        get { _constraint.item }
        set { _constraint.item = newValue }
    }

    public var attribute: Attribute? {
        get { _constraint.attribute }
        set { _constraint.attribute = newValue }
    }

    public var relation: Relation {
        get { _constraint.relation }
        set { _constraint.relation = newValue }
    }

    public var multiplier: CGFloat {
        get { _constraint.multiplier }
        set { _constraint.multiplier = newValue }
    }

    public var constant: CGFloat {
        get { _constraint.constant }
        set { _constraint.constant = newValue }
    }

    public var priority: UILayoutPriority {
        get { _constraint.priority }
        set { _constraint.priority = newValue }
    }

    public var isActive: Bool {
        get { _constraint.isActive }
        set { _constraint.isActive = newValue }
    }

    @discardableResult
    func anchor(to anchor: NSLayoutAnchor<T>,
                relationBy: Relation? = nil,
                multiplier: CGFloat? = nil,
                constant: CGFloat? = nil,
                priority: UILayoutPriority? = nil,
                active: Bool? = nil) -> Constraint {
        self.anchor = anchor
        if let relation = relationBy {
            self.relation = relation
        }
        if let multiplier = multiplier {
            self.multiplier = multiplier
        }
        if let constant = constant {
            self.constant = constant
        }
        if let priority = priority {
            self.priority = priority
        }
        if let active = active {
            self.isActive = active
        }
        return constraint
    }
}
