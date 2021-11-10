//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 10/11/21.
//
import Foundation
import XCTest

class RemoteFeedLoader {
    let client: HTTPClient  // Composition
    let url: URL

    init(url: URL, client: HTTPClient) {  // Injected client dependency
        self.url = url
        self.client = client
    }

    func load() {
        client.get(from: url)
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
        let url = URL(string: "http://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let url = URL(string: "http://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)

        sut.load()

        XCTAssertEqual(client.requestedURL, url)
    }
}
