//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 23/03/22.
//

import UIKit

 extension UIRefreshControl {
     func simulatePullToRefresh() {
         simulate(event: .valueChanged)
     }
 }
