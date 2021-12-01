//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 01/12/21.
//

import EssentialFeed
import XCTest

class URLSessionHTTPClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { _, _, error in
            if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}

class URLSessionHTTPClientTests: XCTestCase {
    func test_getFromURL_failsOnRequestError() {
        URLProtocolStub.startInterceptingRequests()
        let url = URL(string: "http://any-url.com")!
        let error  = NSError(domain: "any error", code: 1)
        let sut = URLSessionHTTPClient()
        URLProtocolStub.stub(url: url, error: error)

        let expectation = expectation(description: "Wait for completion")
        sut.get(from: url) { result in
            switch result {
            case let .failure(receivedError as NSError):
                XCTAssertEqual(receivedError, error)
            default:
                XCTFail("Expected failure with error \(error), got \(result) instead")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
        URLProtocolStub.stopInterceptingRequests() // Don't want to be stubbing other tests requests
    }

    // MARK: - Helpers

    private class URLProtocolStub: URLProtocol {
        private static var stubs = [URL: Stub]()

        private struct Stub {
            let error: Error?
        }

        static func stub(url: URL, error: Error? = nil) {
            stubs[url] = Stub(error: error)
        }

        static func startInterceptingRequests() {
            URLProtocolStub.registerClass(URLProtocolStub.self)
        }

        static func stopInterceptingRequests() {
            URLProtocolStub.unregisterClass(URLProtocolStub.self)
            stubs = [:]
        }

        override class func canInit(with request: URLRequest) -> Bool {
            guard let url = request.url else { return false }
            return URLProtocolStub.stubs[url] != nil
        }

        override class func canonicalRequest(for request: URLRequest) -> URLRequest {
            request
        }

        override func startLoading() {
            guard let url = request.url,
                  let stub = URLProtocolStub.stubs[url] else { return }

            if let error = stub.error {
                client?.urlProtocol(self, didFailWithError: error) // Tell URL loading system that an error occurred
            }

            client?.urlProtocolDidFinishLoading(self)
        }

        override func stopLoading() {}
    }
}
