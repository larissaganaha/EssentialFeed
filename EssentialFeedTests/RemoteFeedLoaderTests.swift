//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 10/11/21.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient  // Composition

    init(client: HTTPClient) {  // Injected client dependency
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "http://a-url.com")!)
    }
}

protocol HTTPClient { //  shared state is no longer needed since we have the dependency injection
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {   // Is now a implementation of a protocol, no longer a subtype of a class
    func get(from url: URL) {
        requestedURL = url
    }

    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDateFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
