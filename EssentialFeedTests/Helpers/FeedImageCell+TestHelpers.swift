//
//  FeedImageCell+TestHelpers.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 23/03/22.
//

@testable import EssentialFeed
import Foundation

extension FeedImageCell {
    var isShowingLocation: Bool {
        !locationContainer.isHidden
    }

    var isShowingImageLoadingIndicator: Bool {
        feedImageContainer.isShimmering
    }

    var isShowingRetryAction: Bool {
        !feedImageRetryButton.isHidden
    }

    var locationText: String? {
        locationLabel.text
    }

    var descriptionText: String? {
        descriptionLabel.text
    }

    var renderedImage: Data? {
        feedImageView.image?.pngData()
    }

    func simulateRetryAction() {
        feedImageRetryButton.simulateTap()
    }
}
