//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 12/01/22.
//

import Foundation

public final class CoreDataFeedStore: FeedStore {
     public init() {}

     public func retrieve(completion: @escaping RetrievalCompletion) {
         completion(.empty)
     }

     public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {

     }

     public func deleteCachedFeed(completion: @escaping DeletionCompletion) {

     }

 }
