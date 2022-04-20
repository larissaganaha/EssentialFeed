//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 20/04/22.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        return location != nil
    }
}
