import XCTest

extension XCTestCase  {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        // Runs after each test
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance  should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
