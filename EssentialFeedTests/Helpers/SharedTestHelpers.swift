//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 31/12/21.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}
