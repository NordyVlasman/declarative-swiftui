import XCTest
@testable import DeclarativeUI

final class DeclarativeUITests: XCTestCase {
    func testExample() {
        let url = URL(string: "http://localhost:8090/index.json")!
        let declarativeUI = DeclarativeUI(dataURL: url)
            
        declarativeUI.fetchData() { screen in
            XCTAssertEqual(screen.title, "Home")
        }
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
