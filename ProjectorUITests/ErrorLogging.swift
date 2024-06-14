import Foundation
import XCTest

class ErrorLogging {
    enum ErrorType {
        case assertTrue
        case assertFalse
        case assertEquals
        case assertNotEquals
    }
    
    enum ErrorMessage: String {
        case failedToLoadTrendingView = "Failed To Load Trending View"
        case failedToLoadSearchView = "Failed to Load Search View"
        case failedToLoadImageView = "Failed to Load Image View"
    }
    
    func assert(
        type: ErrorType,
        _ condition1: Bool,
        _ condition2: Bool? = nil, 
        message: ErrorMessage
    ) {
        switch type {
        case .assertTrue:
            XCTAssertTrue(condition1, message.rawValue)
        case .assertFalse:
            XCTAssertFalse(condition1, message.rawValue)
        case .assertEquals:
            if let condition2 = condition2 {
                XCTAssertEqual(condition1, condition2, message.rawValue)
            } else {
                XCTAssertTrue(false, "Condition 2 was not specified")
            }
        case .assertNotEquals:
            if let condition2 = condition2 {
                XCTAssertNotEqual(condition1, condition2, message.rawValue)
            } else {
                XCTAssertTrue(false, "Condition 2 was not specified")
            }
        }
    }
}
