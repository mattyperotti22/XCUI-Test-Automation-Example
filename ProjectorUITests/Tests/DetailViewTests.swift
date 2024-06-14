import XCTest

final class DetailViewTests: BaseTest {
    func testDetailViewComponents() {
        // Given/When detail view loads
        navigateAndVerifyDetailViewLoaded()
        
        // Then items load
        XCTAssertTrue(
            movieDetailView.ratingLabel.label.ratingLabelContainsNumbers(),
            "Rating not displaying correct data"
        )
        XCTAssertTrue(
            movieDetailView.votesLabel.hasData,
            "Votes label is empty"
        )
        XCTAssertTrue(
            movieDetailView.yearLabel.label.isNumber,
            "Year label does not contain number"
        )
        XCTAssertTrue(
            movieDetailView.runtimeLabel.hasData,
            "Run time label is Empty"
        )
        XCTAssertTrue(
            movieDetailView.overview.hasData, 
            "Overview is empty"
        )
        XCTAssertTrue(
            movieDetailView.genreCollectionView.exists,
            "Genre Collection view failed to load"
        )
        XCTAssertTrue(
            movieDetailView.castCollectionView.exists,
            "Cast Collection view failed to load"
        )
    }
    
    func testMoreLikeThisButton() {
        // Given detail view loads
        navigateAndVerifyDetailViewLoaded()
        
        // When more button tapped
        movieDetailView.tapMoreLikeThisButton()
        
        // Then more view should load
        XCTAssertTrue(
            moreLikeThisView.moreLikeThisVC.exists,
            "More like this view failed to load"
        )
    }
    
    func testSaveToWatchList() {
        // Given detail view loads
        navigateAndVerifyDetailViewLoaded()
        
        // When bookmark tapped
        // Check if button is selected and unselect if true
        movieDetailView.resetBookmarkButton()
        
        let movieTitle = movieDetailView.movieTitle.label
        movieDetailView.tapBookmarkButton()
        
        // Then movie saved in watch list
        movieDetailView.tapWatchListNavButton()
        XCTAssertTrue(
            watchListView.rowExists(with: movieTitle),
            "Movie was not added to watch list: \(movieTitle)"
        )
    }
    
    private func navigateAndVerifyDetailViewLoaded() {
        trendingView.tapMovieImage()
        XCTAssertTrue(movieDetailView.movieDetailViewVC.exists)
    }
}
