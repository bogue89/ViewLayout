//
//  ViewLayout.swift
//  ViewLayout
//

import UIKit
import AssociatedFactory

public typealias VerticalAnchor = NSLayoutYAxisAnchor
public typealias HorizontalAnchor = NSLayoutXAxisAnchor
public typealias DimensionAnchor = NSLayoutDimension
public typealias Attribute = NSLayoutConstraint.Attribute
public typealias Relation = NSLayoutConstraint.Relation

public final class ViewLayout {

    private static var Factory = AssociatedFactory<ViewLayout>()

    public static func instance(for view: UIView) -> ViewLayout {
        Factory.instance(view, initializer: {
            ViewLayout(view)
        })!
    }

    /// view object to be constraint
    private unowned let view: UIView

    public init(_ view: UIView) {
        self.view = view
    }

    lazy var anchors        = Ship(view)
    lazy var safeAnchors    = Ship(view.safeAreaLayoutGuide)
    lazy var marginAnchors  = Ship(view.layoutMarginsGuide)

    struct Ship {

        private unowned var guide: AnyObject

        init(_ guide: AnyObject) {
            self.guide = guide
        }

        lazy var top        = Anchor(guide.topAnchor)
        lazy var right      = Anchor(guide.rightAnchor)
        lazy var bottom     = Anchor(guide.bottomAnchor)
        lazy var left       = Anchor(guide.leftAnchor)
        lazy var leading    = Anchor(guide.leadingAnchor)
        lazy var trailing   = Anchor(guide.trailingAnchor)
        lazy var width      = Anchor(guide.widthAnchor)
        lazy var height     = Anchor(guide.heightAnchor)
        lazy var centerX    = Anchor(guide.centerXAnchor)
        lazy var centerY    = Anchor(guide.centerYAnchor)
    }

}

public extension ViewLayout {

    // Add Subview with requirements
    @discardableResult
    func insert(in view: UIView) -> ViewLayout {
        view.addSubview(self.view)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    // Add Subview with requirements
    @discardableResult
    func layout() -> Self {
        (self.view.superview ?? self.view).layoutIfNeeded()
        return self
    }

    func superview() -> UIView {
        guard let superview = self.view.superview else {
            fatalError("can layout view without superview")
        }
        return superview
    }

    @discardableResult
    func constraint(_ attribute: Attribute,
                    to foreignConstraint: Constraint,
                    relation: Relation? = nil,
                    multiplier: CGFloat? = nil,
                    constant: CGFloat? = nil,
                    priority: UILayoutPriority? = nil,
                    active: Bool? = nil) -> Constraint {

        constraint(attribute: attribute,
                   toItem: foreignConstraint.constraint.firstItem as? UIView,
                   toAttribute: foreignConstraint.constraint.firstAttribute,
                   relationBy: relation,
                   multiplier: multiplier,
                   constant: constant,
                   priority: priority,
                   active: active)
    }

    @discardableResult
    func constraint(attribute: Attribute,
                    toItem: UIView? = nil,
                    toAttribute: Attribute = .notAnAttribute,
                    relationBy: Relation? = nil,
                    multiplier: CGFloat? = nil,
                    constant: CGFloat? = nil,
                    priority: UILayoutPriority? = nil,
                    active: Bool? = nil) -> Constraint {

        return Constraint(item: view,
                          attribute: attribute,
                          relatedBy: relationBy ?? .equal,
                          toItem: toItem,
                          toAttribute: toAttribute,
                          multiplier: multiplier ?? 1,
                          constant: constant ?? 0,
                          priority: priority ?? .required,
                          active: active ?? true)
    }

}
