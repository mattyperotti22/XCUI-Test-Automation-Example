import Foundation
import XCTest

class BaseView {
    var app: XCUIApplication {
        return XCUIApplication()
    }
        
    private var tabBar: XCUIElement {
        app.tabBars["Tab Bar"]
    }
    
    func tapBackButton() {
        app.navigationBars["nav-bar"].buttons["Back"].tap()
    }
    
    func tapWatchListNavButton() {
        tabBar.buttons["Watch List"].tap()
    }
    
    func tapTrendingNavButton() {
        tabBar.buttons["Trending"].tap()
    }
}
