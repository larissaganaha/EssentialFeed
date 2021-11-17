//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 10/11/21.
//

import Foundation

// Has no knowledge of the API
public struct FeedItem: Equatable {
    public let id: UUID
    public let description: String? 
    public let location: String?
    public let imageURL: URL

    public init(
        id: UUID,
        description: String?,
        location: String?,
        imageURL: URL
    ) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
