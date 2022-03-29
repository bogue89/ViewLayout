//
//  ViewLayout+ViewAnchors.swift
//  ViewLayout
//

public extension ViewLayout {
    var top: Anchor<VerticalAnchor> {
        get { anchors.top }
        set { anchors.top.anchor = newValue.anchor }
    }
    var right: Anchor<HorizontalAnchor> {
        get { anchors.right }
        set { anchors.right.anchor = newValue.anchor }
    }
    var bottom: Anchor<VerticalAnchor> {
        get { anchors.bottom }
        set { anchors.bottom.anchor = newValue.anchor }
    }
    var left: Anchor<HorizontalAnchor> {
        get { anchors.left }
        set { anchors.left.anchor = newValue.anchor }
    }
    var leading: Anchor<HorizontalAnchor> {
        get { anchors.leading }
        set { anchors.leading.anchor = newValue.anchor }
    }
    var trailing: Anchor<HorizontalAnchor> {
        get { anchors.trailing }
        set { anchors.trailing.anchor = newValue.anchor }
    }
    var width: Anchor<DimensionAnchor> {
        get { anchors.width }
        set { anchors.width.anchor = newValue.anchor }
    }
    var height: Anchor<DimensionAnchor> {
        get { anchors.height }
        set { anchors.height.anchor = newValue.anchor }
    }
    var centerX: Anchor<HorizontalAnchor> {
        get { anchors.centerX }
        set { anchors.centerX.anchor = newValue.anchor }
    }
    var centerY: Anchor<VerticalAnchor> {
        get { anchors.centerY }
        set { anchors.centerY.anchor = newValue.anchor }
    }
    var center: (centerX: Anchor<HorizontalAnchor>, centerY: Anchor<VerticalAnchor>) {
        get { (centerX, centerY) }
        set { centerX = newValue.0; centerY = newValue.1 }
    }
    var leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (left, top) }
        set { left = newValue.0; top = newValue.1 }
    }
    var leftBottom: (`left`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (left, bottom) }
        set { left = newValue.0; bottom = newValue.1 }
    }
    var rightTop: (`right`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (right, top) }
        set { right = newValue.0; top = newValue.1 }
    }
    var rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (right, bottom) }
        set { right = newValue.0; bottom = newValue.1 }
    }
    var leftRight: (`left`: Anchor<HorizontalAnchor>, `right`: Anchor<HorizontalAnchor>) {
        get { (left, right) }
        set { left = newValue.0; right = newValue.1 }
    }
    var topBottom: (top: Anchor<VerticalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (top, bottom) }
        set { top = newValue.0; bottom = newValue.1 }
    }
    var position: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (left, top) }
        set { left = newValue.0; top = newValue.1 }
    }
    var frame: (leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>),
                rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>)) {
        get { (leftTop, rightBottom) }
        set { leftTop = newValue.0; rightBottom = newValue.1 }
    }
    var size: (width: Anchor<DimensionAnchor>, height: Anchor<DimensionAnchor>) {
        get { (width, height) }
        set { width = newValue.0; height = newValue.1 }
    }
}
