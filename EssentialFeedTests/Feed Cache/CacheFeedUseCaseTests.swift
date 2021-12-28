//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 28/12/21.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {

    }
}

class FeedStore {
    var deletedCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {
    func test() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deletedCachedFeedCallCount, 0)
    }
}
