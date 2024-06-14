import Foundation

protocol Views {}

extension Views {
    var trendingView: TrendingView {
        TrendingView()
    }
    
    var searchView: SearchView {
        SearchView()
    }
    
    var movieDetailView: MovieDetailView {
        MovieDetailView()
    }
    
    var watchListView: WatchListView {
        WatchListView()
    }
    
    var moreLikeThisView: MoreLikeThisView {
        MoreLikeThisView()
    }
}
