import Foundation
import XCTest

extension String {
    func ratingLabelContainsNumbers() -> Bool {
        let ratingNumber = split(separator: ".")
        if ratingNumber.count > 2 {
            return false
        }
        
        for number in ratingNumber {
            if !String(number).isNumber && number.count != 1 {
                return false
            }
        }
        return true
    }
    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

extension XCUIElement {
    var hasData: Bool {
        return !self.label.isEmpty
    }
    
    func scrollToElement(element: XCUIElement, direction: SwipeDirection) {
        while !element.exists {
            switch direction {
            case .up:
                swipeDown()
            case .down:
                swipeUp()
            case .right:
                swipeLeft()
            case .left:
                swipeRight()
            }
        }
    }
}

enum SwipeDirection {
    case up
    case down
    case right
    case left
}
