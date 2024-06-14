import Foundation

final class MovieDetailView: BaseView {
    lazy var movieDetailViewVC = app.otherElements["movie-detail-view-controller"]
    lazy var movieTitle = app.staticTexts["movie-title-label"]
    lazy var moreLikeThisButton = app.buttons["more-like-this-button"]
    lazy var bookmarkButton = app.buttons["bookmark-button"]
    lazy var selectedBookmarkButton = app.buttons["bookmark-button-selected"]
    lazy var ratingLabel = app.staticTexts["detail-rating-label"]
    lazy var votesLabel = app.staticTexts["detail-vote-count-label"]
    lazy var yearLabel = app.staticTexts["detail-movie-year"]
    lazy var runtimeLabel = app.staticTexts["detail-movie-runtime"]
    lazy var overview = app.staticTexts["detail-movie-overview"]
    lazy var genreCollectionView = app.collectionViews["detail-genre-collection-view"]
    lazy var castCollectionView = app.collectionViews["detail-cast-collection-view"]
    
    func tapMoreLikeThisButton() {
        moreLikeThisButton.tap()
    }
    
    func tapBookmarkButton() {
        bookmarkButton.tap()
    }
    
    func bookmarkButtonSelected() -> Bool {
        selectedBookmarkButton.exists
    }
    
    func resetBookmarkButton() {
        if bookmarkButtonSelected() {
            tapBookmarkButton()
        }
    }
}
