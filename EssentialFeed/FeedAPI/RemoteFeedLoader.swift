//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 15/11/21.
//

import Foundation

public protocol HTTPClient { //  shared state is no longer needed since we have the dependency injection
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient  // Composition


    public enum Error: Swift.Error {
        case connectivity
    }

    public init(url: URL, client: HTTPClient) {  // Injected client dependency
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Error) -> Void = { _ in }) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}
