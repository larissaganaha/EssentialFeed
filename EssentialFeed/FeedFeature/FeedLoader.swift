//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 10/11/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}