//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 15/11/21.
//

import Foundation

public protocol HTTPClient { //  shared state is no longer needed since we have the dependency injection
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient  // Composition

    public init(url: URL, client: HTTPClient) {  // Injected client dependency
        self.url = url
        self.client = client
    }

    public func load() {
        client.get(from: url)
    }
}
