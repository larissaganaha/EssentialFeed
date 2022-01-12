//
//  XCTestCase+FeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 12/01/22.
//

import EssentialFeed
import XCTest

extension FeedStoreSpecs where Self: XCTestCase {
    @discardableResult
    func insert(_ cache: (feed: [LocalFeedImage], timestamp: Date), to sut: FeedStore) -> Error? {
        let expectation = expectation(description: "Wait for cache insertion")
        var insertionError: Error?
        sut.insert(cache.feed, timestamp: cache.timestamp) {  receivedInsertionError in
            insertionError = receivedInsertionError
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
        return insertionError
    }

    @discardableResult
    func deleteCache(from sut: FeedStore) -> Error? {
        let expectation = expectation(description: "Wait for cache deletion")
        var deletionError: Error?
        sut.deleteCachedFeed { receivedDeletionError in
            deletionError = receivedDeletionError
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        return deletionError
    }

    func expect(_ sut: FeedStore, toRetrieveTwice expectedResult: RetrievedCachedResult, file: StaticString = #filePath, line: UInt = #line) {
        expect(sut, toRetrieve: expectedResult)
        expect(sut, toRetrieve: expectedResult)
    }

    func expect(_ sut: FeedStore, toRetrieve expectedResult: RetrievedCachedResult, file: StaticString = #filePath, line: UInt = #line) {
        let expectation = expectation(description: "Wait for cache retrieval")
        sut.retrieve { retrievedResult in
            switch (expectedResult, retrievedResult) {
            case (.empty, .empty),
                (.failure, .failure):
                break
            case let (.found(expected), .found(retrieved)):
                XCTAssertEqual(retrieved.feed, expected.feed, file: file, line: line)
                XCTAssertEqual(retrieved.timestamp, expected.timestamp, file: file, line: line)
            default:
                XCTFail("Expected to retrieve \(expectedResult), got \(retrievedResult) instead", file: file, line: line)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
