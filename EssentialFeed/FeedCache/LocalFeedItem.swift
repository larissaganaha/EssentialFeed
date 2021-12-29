//
//  LocalFeedItem.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 29/12/21.
//

import Foundation

// Allows object changes at their own pace for different reasons
// Data Transfer Object Representation
public struct LocalFeedItem: Equatable {
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
