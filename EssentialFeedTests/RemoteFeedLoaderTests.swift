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

    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()

        var capturedErrors = [RemoteFeedLoader.Error]()

        sut.load { capturedErrors.append($0)}

        let clientError = NSError(domain: "Test", code: 0)
        client.complete(with: clientError)

        XCTAssertEqual(capturedErrors, [.connectivity])
    }

    // MARK: - Helpers

    private func makeSUT(url: URL = URL(string: "http://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = (RemoteFeedLoader(url: url, client: client))
        return (sut, client)
    }

    private class HTTPClientSpy: HTTPClient {   // Is now a implementation of a protocol, no longer a subtype of a class
        var requestedURLs = [URL]()
        var error: Error?
        var completions = [(Error) -> Void]()

        func get(from url: URL, completion: @escaping (Error) -> Void) {
            completions.append(completion)
            requestedURLs.append(url)
        }

        func complete(with error: Error, at index: Int = 0) {
            completions[index](error)
        }
    }
}