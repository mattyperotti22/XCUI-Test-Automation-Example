import Foundation
import XCTest

final class WatchListView: BaseView {
    lazy var watchlistVC = app.otherElements["watch-list-view-controller"]
    lazy var movieTableCell = app.tableRows["movie-table-cell"]
    lazy var movieTableView = app.tables["movie-table-view"]
    
    func tapRow(with text: String) {
        app.tables.staticTexts[text].tap()
    }
    
    func swipeLeft(on text: String) {
        app.tables.staticTexts[text].swipeLeft()
    }
    
    func rowExists(with text: String) -> Bool {
        app.tables.staticTexts[text].exists
    }
    
    func tapDelete() {
        app.tables["watch-list-table-view"].buttons["Delete"].tap()
    }
}
