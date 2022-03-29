//
//  ViewLayout+MarginAnchors.swift
//  ViewLayout
//

public extension ViewLayout {
    var topMargin: Anchor<VerticalAnchor> {
        get { marginAnchors.top }
        set { marginAnchors.top.anchor = newValue.anchor }
    }
    var rightMargin: Anchor<HorizontalAnchor> {
        get { marginAnchors.right }
        set { marginAnchors.right.anchor = newValue.anchor }
    }
    var bottomMargin: Anchor<VerticalAnchor> {
        get { marginAnchors.bottom }
        set { marginAnchors.bottom.anchor = newValue.anchor }
    }
    var leftMargin: Anchor<HorizontalAnchor> {
        get { marginAnchors.left }
        set { marginAnchors.left.anchor = newValue.anchor }
    }
    var leadingMargin: Anchor<HorizontalAnchor> {
        get { marginAnchors.leading }
        set { marginAnchors.leading.anchor = newValue.anchor }
    }
    var trailingMargin: Anchor<HorizontalAnchor> {
        get { marginAnchors.trailing }
        set { marginAnchors.trailing.anchor = newValue.anchor }
    }
    var widthMargin: Anchor<DimensionAnchor> {
        get { marginAnchors.width }
        set { marginAnchors.width.anchor = newValue.anchor }
    }
    var heightMargin: Anchor<DimensionAnchor> {
        get { marginAnchors.height }
        set { marginAnchors.height.anchor = newValue.anchor }
    }
    var centerXMargin: Anchor<HorizontalAnchor> {
        get { marginAnchors.centerX }
        set { marginAnchors.centerX.anchor = newValue.anchor }
    }
    var centerYMargin: Anchor<VerticalAnchor> {
        get { marginAnchors.centerY }
        set { marginAnchors.centerY.anchor = newValue.anchor }
    }
    var centerMargin: (centerX: Anchor<HorizontalAnchor>, centerY: Anchor<VerticalAnchor>) {
        get { (centerXMargin, centerYMargin) }
        set { centerXMargin = newValue.0; centerYMargin = newValue.1 }
    }
    var leftTopMargin: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (leftMargin, topMargin) }
        set { leftMargin = newValue.0; topMargin = newValue.1 }
    }
    var leftBottomMargin: (`left`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (leftMargin, bottomMargin) }
        set { leftMargin = newValue.0; bottomMargin = newValue.1 }
    }
    var rightTopMargin: (`right`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (rightMargin, topMargin) }
        set { rightMargin = newValue.0; topMargin = newValue.1 }
    }
    var rightBottomMargin: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (rightMargin, bottomMargin) }
        set { rightMargin = newValue.0; bottomMargin = newValue.1 }
    }
    var leftRightMargin: (`left`: Anchor<HorizontalAnchor>, `right`: Anchor<HorizontalAnchor>) {
        get { (leftMargin, rightMargin) }
        set { leftMargin = newValue.0; rightMargin = newValue.1 }
    }
    var topBottomMargin: (top: Anchor<VerticalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (topMargin, bottomMargin) }
        set { topMargin = newValue.0; bottomMargin = newValue.1 }
    }
    var positionMargin: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (leftMargin, topMargin) }
        set { leftMargin = newValue.0; topMargin = newValue.1 }
    }
    var frameMargin: (leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>),
                      rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>)) {
        get { (leftTopMargin, rightBottomMargin) }
        set { leftTopMargin = newValue.0; rightBottomMargin = newValue.1 }
    }
    var sizeMargin: (width: Anchor<DimensionAnchor>, height: Anchor<DimensionAnchor>) {
        get { (widthMargin, heightMargin) }
        set { widthMargin = newValue.0; heightMargin = newValue.1 }
    }
}
