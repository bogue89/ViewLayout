//
//  ViewLayout+SafeAnchors.swift
//  ViewLayout
//

import Foundation

public extension ViewLayout {
    var topSafe: Anchor<VerticalAnchor> {
        get { safeAnchors.top }
        set { safeAnchors.top.anchor = newValue.anchor }
    }
    var rightSafe: Anchor<HorizontalAnchor> {
        get { safeAnchors.right }
        set { safeAnchors.right.anchor = newValue.anchor }
    }
    var bottomSafe: Anchor<VerticalAnchor> {
        get { safeAnchors.bottom }
        set { safeAnchors.bottom.anchor = newValue.anchor }
    }
    var leftSafe: Anchor<HorizontalAnchor> {
        get { safeAnchors.left }
        set { safeAnchors.left.anchor = newValue.anchor }
    }
    var leadingSafe: Anchor<HorizontalAnchor> {
        get { safeAnchors.leading }
        set { safeAnchors.leading.anchor = newValue.anchor }
    }
    var trailingSafe: Anchor<HorizontalAnchor> {
        get { safeAnchors.trailing }
        set { safeAnchors.trailing.anchor = newValue.anchor }
    }
    var widthSafe: Anchor<DimensionAnchor> {
        get { safeAnchors.width }
        set { safeAnchors.width.anchor = newValue.anchor }
    }
    var heightSafe: Anchor<DimensionAnchor> {
        get { safeAnchors.height }
        set { safeAnchors.height.anchor = newValue.anchor }
    }
    var centerXSafe: Anchor<HorizontalAnchor> {
        get { safeAnchors.centerX }
        set { safeAnchors.centerX.anchor = newValue.anchor }
    }
    var centerYSafe: Anchor<VerticalAnchor> {
        get { safeAnchors.centerY }
        set { safeAnchors.centerY.anchor = newValue.anchor }
    }
    var centerSafe: (centerX: Anchor<HorizontalAnchor>, centerY: Anchor<VerticalAnchor>) {
        get { (centerXSafe, centerYSafe) }
        set { centerXSafe = newValue.0; centerYSafe = newValue.1 }
    }
    var leftTopSafe: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (leftSafe, topSafe) }
        set { leftSafe = newValue.0; topSafe = newValue.1 }
    }
    var leftBottomSafe: (`left`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (leftSafe, bottomSafe) }
        set { leftSafe = newValue.0; bottomSafe = newValue.1 }
    }
    var rightTopSafe: (`right`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (rightSafe, topSafe) }
        set { rightSafe = newValue.0; topSafe = newValue.1 }
    }
    var rightBottomSafe: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (rightSafe, bottomSafe) }
        set { rightSafe = newValue.0; bottomSafe = newValue.1 }
    }
    var leftRightSafe: (`left`: Anchor<HorizontalAnchor>, `right`: Anchor<HorizontalAnchor>) {
        get { (leftSafe, rightSafe) }
        set { leftSafe = newValue.0; rightSafe = newValue.1 }
    }
    var topBottomSafe: (top: Anchor<VerticalAnchor>, bottom: Anchor<VerticalAnchor>) {
        get { (topSafe, bottomSafe) }
        set { topSafe = newValue.0; bottomSafe = newValue.1 }
    }
    var positionSafe: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>) {
        get { (leftSafe, topSafe) }
        set { leftSafe = newValue.0; topSafe = newValue.1 }
    }
    var frameSafe: (leftTop: (`left`: Anchor<HorizontalAnchor>, top: Anchor<VerticalAnchor>),
                    rightBottom: (`right`: Anchor<HorizontalAnchor>, bottom: Anchor<VerticalAnchor>)) {
        get { (leftTopSafe, rightBottomSafe) }
        set { leftTopSafe = newValue.0; rightBottomSafe = newValue.1 }
    }
    var sizeSafe: (width: Anchor<DimensionAnchor>, height: Anchor<DimensionAnchor>) {
        get { (widthSafe, heightSafe) }
        set { widthSafe = newValue.0; heightSafe = newValue.1 }
    }
}
