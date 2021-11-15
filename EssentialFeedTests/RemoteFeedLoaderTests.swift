//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 10/11/21.
//
import Foundation
@testable import EssentialFeed
import XCTest

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDateFromURL() {
        let url = URL(string: "http://a-url.com")!
        let (_, client) = makeSUT(url: url)

        XCTAssertTrue(client.requestedURLs.isEmpty)
    }

    func test_load_requestsDataFromURL() {
        let url = URL(string: "http://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()

        XCTAssertEqual(client.requestedURLs, [url])
    }

    func test_loadTwice_requestsDataFromURLTwixe() {
        let url = URL(string: "http://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()
        sut.load()

        XCTAssertEqual(client.requestedURLs, [url, url])
    }

    // MARK: - Helpers

    private func makeSUT(url: URL = URL(string: "http://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = (RemoteFeedLoader(url: url, client: client))
        return (sut, client)
    }

    private class HTTPClientSpy: HTTPClient {   // Is now a implementation of a protocol, no longer a subtype of a class
        var requestedURLs = [URL]()

        func get(from url: URL) {
            requestedURLs.append(url)
        }
    }
}
