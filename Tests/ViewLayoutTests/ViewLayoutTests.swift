import XCTest
import ViewLayout

final class ViewLayoutTests: XCTestCase {

    weak var layout: ViewLayout? = nil

    func testWeakAssociatedObject() {

        var view: UIView? = UIView()

        // given
        layout = view?.layout
        // when
        view = nil
        // then
        XCTAssertNil(layout, "Object retained")
    }

    func testResolvedConstraints() {
        let superview = UIView()
        let view = UIView()

        superview.addSubview(view)

        let isActiveBeforeResolving = view.layout.top.isActive
        view.layout.top.constant = 0
        let isActiveAfterResolving = view.layout.top.isActive

        XCTAssertFalse(isActiveBeforeResolving,"accessing the anchor should not resolve constraint")
        XCTAssertTrue(isActiveAfterResolving, "ViewLayout not resolving when setting a constant")
    }

    func testResolvedRelationship() {
        let superview = UIView()
        let view = UIView()

        superview.addSubview(view)
        view.layout.top.constant = 0

        let resolvedItem = view.layout.top.item as? UIView
        XCTAssertEqual(resolvedItem, superview, "ViewLayout resolving constraint should use view's parent")
    }
}
