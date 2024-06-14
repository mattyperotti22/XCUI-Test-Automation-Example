import Foundation
import XCTest

final class SearchTests: BaseTest {
    func testSearch() {
        trendingView.tapSearchButton()
        
        searchView.typeText(text: "Hello")
    }
    
}
