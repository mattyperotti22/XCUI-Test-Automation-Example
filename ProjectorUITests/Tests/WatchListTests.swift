import XCTest

final class WatchListTests: BaseTest {
    func testClickingOnWatchListRowDisplaysDetailPage() {
        // Given item in watchlist
        addMovieToWatchList()
        let movieTitle = movieDetailView.movieTitle.label
        
        // When item is clicked
        movieDetailView.tapWatchListNavButton()
        watchListView.tapRow(with: movieTitle)
      
        // Then correct movie detail page displayed
        XCTAssertTrue(
            movieDetailView.movieDetailViewVC.exists,
            "Movie detail view failed to load"
        )
        let detailPageMovieTitle = movieDetailView.movieTitle.label
        XCTAssertEqual(
            detailPageMovieTitle, movieTitle,
            "Movie titles did not match Expected: \(movieTitle) Found: \(detailPageMovieTitle)")
    }
    
    func testRemovingWatchListItem() {
        // Given item in watchlist
        addMovieToWatchList()
        
        // When item is removed
        let movieTitle = movieDetailView.movieTitle.label
        movieDetailView.tapWatchListNavButton()
        watchListView.swipeLeft(on: movieTitle)
        watchListView.tapDelete()

        // Then item should be removed from list
        XCTAssertFalse(
            watchListView.rowExists(with: movieTitle),
            "Item was not removed from the watchlist"
        )
    }
    
    func testAllCells() {
        trendingView.tapWatchListNavButton()
        
        let cells = app.cells
        
        XCTAssertTrue(cells.element(boundBy: 2).staticTexts["Inside Out 2"].exists)
    }
    
    
    
    private func addMovieToWatchList() {
        trendingView.tapMovieImage()
        if !movieDetailView.bookmarkButtonSelected() {
            movieDetailView.tapBookmarkButton()
        }
    }
}

