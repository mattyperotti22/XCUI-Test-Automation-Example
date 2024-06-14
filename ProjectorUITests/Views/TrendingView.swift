import Foundation
import XCTest

final class TrendingView: BaseView {
    lazy var movieImageView = app.collectionViews.images["movie-image-view"].firstMatch
    lazy var trendingView = app.otherElements["main-view-controller"]
    lazy var genreCollectionView = app.collectionViews["genre-collection-view"]
    lazy var headerCollectionView = app.collectionViews["header-collection-view"]
    lazy var movieTitleLabel = app.staticTexts["movie-title-label"].firstMatch
    lazy var movieRatingLabel = app.staticTexts["movie-rating-label"].firstMatch
    lazy var searchButton = app.navigationBars["nav-bar"].buttons["search-button"]
    lazy var topRated = headerCollectionView.staticTexts["Top Rated"]

    func tapMovieImage() {
        movieImageView.tap()
    }
    
    func tapMovieTitleLabel() {
        movieTitleLabel.tap()
    }
    
    func tapSearchButton() {
        searchButton.tap()
    }
    
    func tapTopRated() {
        topRated.tap()
    }
}
