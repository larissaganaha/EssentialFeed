//
//  FeedViewModel.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 20/04/22.
//

import Foundation

final class FeedViewModel {
    private let feedLoader: FeedLoader

    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    var onChange: ((FeedViewModel) -> Void)?
    var onFeedLoad: (([FeedImage]) -> Void)?

    private(set) var isLoading: Bool = false {
        didSet { onChange?(self) }
    }

    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
            self?.onFeedLoad?(feed)
            }
            self?.isLoading = false
        }
    }
}
