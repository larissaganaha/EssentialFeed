//
//  ManagedCache+CoreDataProperties.swift
//  EssentialFeed
//
//  Created by Larissa Ganaha on 12/01/22.
//
//

import Foundation
import CoreData


// MARK: Generated accessors for feed
extension ManagedCache {

    @objc(insertObject:inFeedAtIndex:)
    @NSManaged public func insertIntoFeed(_ value: ManagedFeedImage, at idx: Int)

    @objc(removeObjectFromFeedAtIndex:)
    @NSManaged public func removeFromFeed(at idx: Int)

    @objc(insertFeed:atIndexes:)
    @NSManaged public func insertIntoFeed(_ values: [ManagedFeedImage], at indexes: NSIndexSet)

    @objc(removeFeedAtIndexes:)
    @NSManaged public func removeFromFeed(at indexes: NSIndexSet)

    @objc(replaceObjectInFeedAtIndex:withObject:)
    @NSManaged public func replaceFeed(at idx: Int, with value: ManagedFeedImage)

    @objc(replaceFeedAtIndexes:withFeed:)
    @NSManaged public func replaceFeed(at indexes: NSIndexSet, with values: [ManagedFeedImage])

    @objc(addFeedObject:)
    @NSManaged public func addToFeed(_ value: ManagedFeedImage)

    @objc(removeFeedObject:)
    @NSManaged public func removeFromFeed(_ value: ManagedFeedImage)

    @objc(addFeed:)
    @NSManaged public func addToFeed(_ values: NSOrderedSet)

    @objc(removeFeed:)
    @NSManaged public func removeFromFeed(_ values: NSOrderedSet)

}
