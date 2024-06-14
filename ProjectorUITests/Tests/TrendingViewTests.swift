import XCTest

final class TrendingViewTests: BaseTest {
    let failureMessage = "failed to load!"
    lazy var trendingViewFailureMessage = "Trending view \(failureMessage)"
    lazy var movieDetailViewFailureMessage = "Movie detail view \(failureMessage)"
    lazy var image = app.staticTexts["The Fall Guy"]
    lazy var genreElement = app.staticTexts["Drama"]

    func testMainPageComponents() {
        // Given/When Trending Page loads
        verifyTrendingPageLoaded()
        
        // Then items load
        errorLogging.assert(
            type: .assertTrue,
            trendingView.movieImageView.firstMatch.isHittable,
            message: .failedToLoadImageView
        )
        
        errorLogging.assert(
            type: .assertFalse,
            trendingView.movieImageView.firstMatch.isHittable,
            message: .failedToLoadSearchView
        )
        
        XCTAssertTrue(
            trendingView.genreCollectionView.exists,
            "Genre collection \(failureMessage)"
        )
        XCTAssertTrue(
            trendingView.headerCollectionView.exists,
            "Header collection view \(failureMessage)"
        )
        XCTAssertTrue(
            trendingView.movieTitleLabel.hasData, 
            "Movie Title is empty"
        )
        XCTAssertTrue(
            trendingView.movieRatingLabel.label.ratingLabelContainsNumbers(),
            "Rating not displaying correct data"
        )
    }
    
    func testClickingImageLoadsDetailPage() {
        // Given Trending Page loads
        verifyTrendingPageLoaded()
        
        // When image is tapped
        trendingView.tapMovieImage()
        
        // Then movie detail page should load
        XCTAssertTrue(
            movieDetailView.movieDetailViewVC.exists,
            movieDetailViewFailureMessage
        )
    }
    
    func testClickingMovieTitleLoadsDetailPage() {
        // Given Trending Page loads
        verifyTrendingPageLoaded()
        
        // When title is tapped
        let movieTitle = trendingView.movieTitleLabel.label
        trendingView.tapMovieTitleLabel()
        
        // Then movie detail page should load and is correct page
        XCTAssertTrue(
            movieDetailView.movieDetailViewVC.exists,
            movieDetailViewFailureMessage
        )
        
        let detailViewMovieTitle = movieDetailView.movieTitle.label
        XCTAssertEqual(
            detailViewMovieTitle,
            movieTitle,
            "Movie titles do not match. Found: \(movieTitle) Expected: \(detailViewMovieTitle)"
        )
    }
    
    func testClickingSearchButtonLoadsSearchPage() {
        // Given Trending Page loads
        verifyTrendingPageLoaded()

        // When search button is tapped
        trendingView.tapSearchButton()
        
        // Then search view loads
        XCTAssertTrue(
            searchView.searchField.exists,
            "Search view \(failureMessage)"
        )
    }
    
    func testHeaderFiltering() {
        ///  Flaky test alert- Don't love that Now Playing movie could also be the top popular and top rated
        ///  movie which would cause the test to fail.
        
        // Given Trending Page loads
        verifyTrendingPageLoaded()
        let nowPlayingMovieTitle = trendingView.movieTitleLabel.label
        
        // When Top Rated tapped
        trendingView.tapTopRated()
        let topRatedMovieTitle = trendingView.movieTitleLabel.label
        
        // Then Movie should change
        XCTAssertNotEqual(
            nowPlayingMovieTitle,
            topRatedMovieTitle,
            "Movies should be different. Movies: \(nowPlayingMovieTitle) and \(topRatedMovieTitle)"
        )
    }
    
    func testSwipe() {
        trendingView.genreCollectionView.scrollToElement(element: genreElement, direction: .right)
    }
    
    private func verifyTrendingPageLoaded() {
        XCTAssertTrue(
            trendingView.trendingView.exists,
            trendingViewFailureMessage
        )
    }
}
