import Foundation

final class SearchView: BaseView {
    lazy var searchVC = app.otherElements["search-view-controller"]
    lazy var searchField = app.searchFields["search-field"]
    
    func typeText(text: String) {
        searchField.tap()
        searchField.typeText(text)
    }
}
