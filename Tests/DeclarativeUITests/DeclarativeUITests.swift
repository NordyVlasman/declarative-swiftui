import XCTest
@testable import DeclarativeUI

final class DeclarativeUITests: XCTestCase {
    func testExample() {
        let url = URL(string: "http://localhost:4000/application")!
        let declarativeUI = DeclarativeUI(dataURL: url)
            
        declarativeUI.fetchData() { screen in
            XCTAssertEqual(screen.title, "Home")
        }
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
