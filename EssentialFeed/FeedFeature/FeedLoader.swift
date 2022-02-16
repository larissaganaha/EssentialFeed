//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 10/11/21.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
