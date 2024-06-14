import XCTest

class BaseTest: XCTestCase, Views {
    let app = XCUIApplication()
    let errorLogging = ErrorLogging()

     override func setUp() {
        continueAfterFailure = true
        app.launch()
     }

    override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let fullScreenshotAttachment = XCTAttachment(screenshot: screenshot)
        fullScreenshotAttachment.lifetime = .deleteOnSuccess
        add(fullScreenshotAttachment)
        app.terminate()
     }
}
