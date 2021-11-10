//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 10/11/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "http://a-url.com")!)
    }
}

// Not a Singleton anymore
class  HTTPClient {
    static var shared = HTTPClient() // Global State

    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {   // Test Type
    override func get(from url: URL) {
        requestedURL = url
    }

    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDateFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
