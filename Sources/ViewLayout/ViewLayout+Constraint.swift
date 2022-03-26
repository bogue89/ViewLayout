//
//  ViewLayout+Constraint.swift
//  ViewLayout
//

import UIKit

public extension ViewLayout {

    class Constraint: Hashable {

        public static func == (lhs: Constraint, rhs: Constraint) -> Bool {
            ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
        }
        public final func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }

        public convenience init(_ constraint: NSLayoutConstraint,
                                toItem secondItem: AnyObject? = nil,
                                toAttribute secondAttribute: Attribute? = nil,
                                multiplier: CGFloat? = nil,
                                constant: CGFloat? = nil,
                                priority: UILayoutPriority? = nil,
                                active: Bool = false) {

            guard let item = constraint.firstItem else {
                fatalError("trying to resolve unconfigured constraint")
            }
            self.init(item: item,
                      attribute: constraint.firstAttribute,
                      relatedBy: constraint.relation,
                      toItem: secondItem ?? constraint.secondItem,
                      toAttribute: secondAttribute ?? constraint.secondAttribute,
                      multiplier: multiplier ?? constraint.multiplier,
                      constant: constant ?? constraint.constant,
                      priority: priority ?? constraint.priority,
                      active: active)
        }

        public convenience init(item: AnyObject,
                                attribute: Attribute,
                                relatedBy: Relation = .equal,
                                multiplier: CGFloat = 1,
                                constant: CGFloat = 0,
                                priority: UILayoutPriority = .defaultHigh,
                                active: Bool = false) {

            self.init(item: item,
                      attribute: attribute,
                      relatedBy: relatedBy,
                      toItem: item,
                      toAttribute: attribute,
                      multiplier: multiplier,
                      constant: constant,
                      priority: priority,
                      active: active)
        }

        public required init(item firstItem: AnyObject,
                             attribute firstAttribute: Attribute,
                             relatedBy relation: Relation = .equal,
                             toItem secondItem: AnyObject?,
                             toAttribute secondAttribute: Attribute?,
                             multiplier: CGFloat = 1,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = .defaultHigh,
                             active: Bool = false) {

            self.item = secondItem
            self.attribute = secondAttribute
            self.relation = relation
            self.multiplier = multiplier
            self.constant = constant
            self.priority = priority
            self._constraint = NSLayoutConstraint(item: firstItem,
                                                  attribute: firstAttribute,
                                                  relatedBy: relation,
                                                  toItem: secondItem,
                                                  attribute: secondAttribute ?? .notAnAttribute,
                                                  multiplier: multiplier,
                                                  constant: constant)
            self._constraint.isActive = active
        }

        private func resolveConstraint(item: AnyObject? = nil,
                                       attribute: Attribute? = nil,
                                       relation: Relation? = nil,
                                       multiplier: CGFloat? = nil,
                                       constant: CGFloat? = nil) -> NSLayoutConstraint {

            guard let firstItem = _constraint.firstItem else {
                fatalError("trying to resolve unconfigured constraint")
            }
            let firstAttribute = _constraint.firstAttribute
            let relation = relation ?? _constraint.relation
            var secondItem = (item ?? _constraint.secondItem)
            let secondAttribute = attribute ?? _constraint.secondAttribute
            let multiplier = multiplier ?? _constraint.multiplier
            let constant = constant ?? _constraint.constant

            if constant != 0,
               let first = firstItem as? UIView,
               let second = secondItem as? UIView,
               first == second {
                if !([.width, .height].contains(firstAttribute)) {
                    secondItem = first.superview
                } else if firstAttribute == secondAttribute {
                    secondItem = nil
                }
            }

            return NSLayoutConstraint(item: firstItem,
                                      attribute: firstAttribute,
                                      relatedBy: relation,
                                      toItem: secondItem,
                                      attribute: secondAttribute,
                                      multiplier: multiplier,
                                      constant: constant)
        }

        private var _constraint: NSLayoutConstraint {
            willSet {
                _constraint.isActive = false
                newValue.priority = priority
                newValue.isActive = true
            }
        }

        public var constraint: NSLayoutConstraint {
            get {
                _constraint
            }
            set {
                guard let firstItem = constraint.firstItem else {
                    fatalError("trying to satifying unconfigured constraint")
                }
                _constraint = NSLayoutConstraint(item: firstItem,
                                                 attribute: constraint.firstAttribute,
                                                 relatedBy: constraint.relation,
                                                 toItem: newValue.firstItem,
                                                 attribute: newValue.firstAttribute,
                                                 multiplier: constraint.multiplier,
                                                 constant: constraint.constant)
            }
        }

        public weak var item: AnyObject? {
            didSet {
                // Cannot assign to property: 'secondItem' is a get-only property
                //  constraint.secondItem = secondItem
                _constraint = resolveConstraint(item: item)
            }
        }

        public var attribute: Attribute? {
            didSet {
                // Cannot assign to property: 'secondAttribute' is a get-only property
                //  constraint.secondAttribute = secondAttribute
                _constraint = resolveConstraint(attribute: attribute)
            }
        }

        public var relation: Relation {
            didSet {
                // Cannot assign to property: 'relation' is a get-only property
                // constraint.relation = relation
                _constraint = resolveConstraint(relation: relation)
            }
        }

        public var multiplier: CGFloat {
            didSet {
                // Cannot assign to property: 'multiplier' is a get-only property
                // constraint.multiplier = multiplier
                _constraint = resolveConstraint(multiplier: multiplier)
            }
        }

        public var constant: CGFloat {
            didSet {
                // Can assign property: 'constant' but we want to handle conflicts
                // constraint.constant = constant
                _constraint = resolveConstraint(constant: constant)
            }
        }

        public var isActive: Bool {
            get {
                _constraint.isActive
            }
            set {
                _constraint.isActive = newValue
            }
        }

        public var priority: UILayoutPriority {
            didSet {
                // Can assign property: 'priority' and wait for a change in properties to apply it
                _constraint.priority = priority
            }
        }

        @discardableResult
        func constraint(to foreignConstraint: Constraint,
                        relation: Relation? = nil,
                        multiplier: CGFloat? = nil,
                        constant: CGFloat? = nil,
                        priority: UILayoutPriority? = nil,
                        active: Bool? = nil) -> Self {

            constraint(item: foreignConstraint.item,
                       attribute: foreignConstraint.attribute ?? .notAnAttribute,
                       relation: relation ?? foreignConstraint.relation,
                       multiplier: multiplier,
                       constant: constant,
                       priority: priority,
                       active: active)
        }

        @discardableResult
        func constraint(item: AnyObject? = nil,
                        attribute: Attribute = .notAnAttribute,
                        relation: Relation? = nil,
                        multiplier: CGFloat? = nil,
                        constant: CGFloat? = nil,
                        priority: UILayoutPriority? = nil,
                        active: Bool? = nil) -> Self {

            guard let firstItem = constraint.firstItem else {
                fatalError("trying to satifying unconfigured constraint")
            }
            let constraint = Self.init(item: firstItem,
                                       attribute: self.constraint.firstAttribute,
                                       relatedBy: relation ?? .equal,
                                       toItem: item,
                                       toAttribute: attribute,
                                       multiplier: multiplier ?? 1,
                                       constant: constant ?? 0,
                                       priority: priority ?? .required)
            constraint.isActive = active ?? true
            return constraint
        }
    }

}

