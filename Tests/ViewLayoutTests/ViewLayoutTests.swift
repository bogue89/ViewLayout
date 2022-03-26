import XCTest
@testable import ViewLayout

final class ViewLayoutTests: XCTestCase {

    weak var layout: ViewLayout? = nil

    func testWeakAssociatedObject() throws {

        var view: UIView? = UIView()

        // given
        layout = view?.layout
        // when
        view = nil
        // then
        XCTAssertNil(layout, "Object retained")
    }
    
}
