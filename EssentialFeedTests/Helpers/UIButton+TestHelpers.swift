//
//  UIButton+TestHelpers.swift
//  EssentialFeedTests
//
//  Created by Larissa Ganaha on 23/03/22.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
