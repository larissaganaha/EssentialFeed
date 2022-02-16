//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 05/01/22.
//

import Foundation

// Could be a struct because requires no identity or a shared state
final class FeedCachePolicy {
    private  init() {}

    private static let calendar = Calendar(identifier: .gregorian)

    private static var maxCacheAgeInDays: Int {
        7
    }

    // `against date: Date` parameter added to make it deterministic, which means it will always have the same value when invoked
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
}
