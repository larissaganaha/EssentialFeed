//
//  LocalFeedItem.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 29/12/21.
//

import Foundation

// Allows object changes at their own pace for different reasons
// Data Transfer Object Representation
public struct LocalFeedImage: Equatable, Codable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL

    public init(
        id: UUID,
        description: String?,
        location: String?,
        url: URL
    ) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
}
