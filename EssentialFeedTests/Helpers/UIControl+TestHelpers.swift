//
//  UIControl+TestHelpers.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 23/03/22.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
